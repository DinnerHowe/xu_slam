/**
 * this is a demo 
 * this file is modified by howe
 * source file's, such as head files, Copyright (c) is under ThingMagic, Inc.
 * this file is free of charge, to any person obtaining a copy
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 */



#include <tm_reader.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <inttypes.h>

#include <ctype.h>
#include <errno.h>
#include <unistd.h>

#define usage() {errx(1, "Please provide reader URL, such as:\n"\
                         "tmr:///dev/com4 or tmr:///dev/ttyUSB0");}


void errx(int exitval, const char *fmt, ...)
{
  //printf ("into errx");
  va_list ap;

  va_start(ap, fmt);
  vfprintf(stderr, fmt, ap);

  //printf("out errx\n");

  exit(exitval);
}

void checkerr(TMR_Reader* rp, TMR_Status ret, int exitval, const char *msg)
{
  //printf("into checkerr\n");
  if (TMR_SUCCESS != ret)
  {
    errx(exitval, "Error %s: %s\n", msg, TMR_strerr(rp, ret));
    //printf("out checkerr \n");
  }
}


void parseAntennaList(uint8_t *antenna, uint8_t *antennaCount, char *args)
{ 
  //printf("into parseAntennaList\n");
  char *token = NULL;
  char *str = ",";
  uint8_t i = 0x00;
  int scans;

  /* get the first token */
  if (NULL == args)
  {
    fprintf(stdout, "Missing argument\n");
    usage();
  }

  token = strtok(args, str);
  if (NULL == token)
  {
    fprintf(stdout, "Missing argument after %s\n", args);
    usage();
  }

  while(NULL != token)
  {
    scans = sscanf(token, "%"SCNu8, &antenna[i]);
    if (1 != scans)
    {
      fprintf(stdout, "Can't parse '%s' as an 8-bit unsigned integer value\n", token);
      usage();
    }
    i++;
    token = strtok(NULL, str);
  }
  *antennaCount = i;
  printf("out parseAntennaList");
}


void callback(TMR_Reader *reader, const TMR_TagReadData *t, void *cookie);
void serialtime(TMR_Reader r, TMR_Reader *rp, TMR_Status ret);
void readasync(TMR_Reader r, TMR_Reader *rp, TMR_Status ret);


//##########################
//          main
//###########################

int main(int argc, char *argv[])
{

#ifndef TMR_ENABLE_BACKGROUND_READS
  printf("TMR_ENABLE_BACKGROUND_READS");
  errx(1, "This sample requires background read functionality.\n"
          "Please enable TMR_ENABLE_BACKGROUND_READS in tm_config.h\n"
          "to run this codelet\n");
  return -1;
#else

  //printf("starting main\n"); 

  TMR_Region region;
  TMR_ReadPlan plan;
  TMR_Status ret;
  TMR_Reader r, *rp;

  uint8_t i;
  uint8_t *antennaList = NULL;
  uint8_t buffer[20];
  uint8_t antennaCount = 0x0;
  TMR_String model;
  char str[64];
#endif

/* varify the arguements */
  //printf("starting arguments varification\n");
  if (argc < 2)
  {
    usage();
  }
  for (i = 2; i < argc; i+=2)
  {
    if(0x00 == strcmp("--ant", argv[i]))
    {
      if (NULL != antennaList)
      {
        fprintf(stdout, "Duplicate argument: --ant specified more than once\n");
        usage();
      }
      parseAntennaList(buffer, &antennaCount, argv[i+1]);
      antennaList = buffer;
    }
    else
    {
      fprintf(stdout, "Argument %s is not recognized\n", argv[i]);
      usage();
    }
  }
/*/

/* creating a reader */
  //printf("starting reader creatation\n");
  rp = &r;
  ret = TMR_create(rp, argv[1]);
  checkerr(rp, ret, 1, "creating reader");
/*/

/* connecting to reader */
  //printf("starting reader connection\n");
  ret = TMR_connect(rp);
  checkerr(rp, ret, 1, "connecting reader");
/*/


/* getting region */
  printf("starting getting region\n");
  region = TMR_REGION_NONE;
  ret = TMR_paramGet(rp, TMR_PARAM_REGION_ID, &region);
  checkerr(rp, ret, 1, "getting region");
  if (TMR_REGION_NONE == region)
  {
    TMR_RegionList regions;
    TMR_Region _regionStore[32];
    regions.list = _regionStore;
    regions.max = sizeof(_regionStore)/sizeof(_regionStore[0]);
    regions.len = 0;
    ret = TMR_paramGet(rp, TMR_PARAM_REGION_SUPPORTEDREGIONS, &regions);
    checkerr(rp, ret, __LINE__, "getting supported regions");
    if (regions.len < 1)
    {
      checkerr(rp, TMR_ERROR_INVALID_REGION, __LINE__, "Reader doesn't supportany regions");
    }
    region = regions.list[0];
    ret = TMR_paramSet(rp, TMR_PARAM_REGION_ID, &region);
    checkerr(rp, ret, 1, "setting region");  
  }

/*read plan*/
 //printf("starting read plan\n");
 model.value = str;
 model.max = 64;
 TMR_paramGet(rp, TMR_PARAM_VERSION_MODEL, &model);

/* initialize the read plan */
 ret = TMR_RP_init_simple(&plan, antennaCount, antennaList, TMR_TAG_PROTOCOL_GEN2, 1000);
 checkerr(rp, ret, 1, "initializing the  read plan");


 /* Commit read plan */
 ret = TMR_paramSet(rp, TMR_PARAM_READ_PLAN, &plan);
 checkerr(rp, ret, 1, "setting read plan");

/*serialtime read plan*/
 serialtime(r, rp, ret);

 TMR_destroy(rp);
 return 0;
}


/*serialtime*/
void serialtime(TMR_Reader r, TMR_Reader *rp, TMR_Status ret)
{  

  //printf ("into serialtime plan");
  ret = TMR_read(rp, 500, NULL);

  if (TMR_ERROR_TAG_ID_BUFFER_FULL == ret)
  {
    /* In case of TAG ID Buffer Full, extract the tags present
    * in buffer.
    */
    fprintf(stdout, "reading tags:%s\n", TMR_strerr(rp, ret));
  }
  else
  {
    checkerr(rp, ret, 1, "reading tags");
  }  

  while (TMR_SUCCESS == TMR_hasMoreTags(rp))
  {
    TMR_TagReadData trd;
    char epcStr[128];
    char timeStr[128];

    ret = TMR_getNextTag(rp, &trd);
    checkerr(rp, ret, 1, "fetching tag");

      TMR_bytesToHex(trd.tag.epc, trd.tag.epcByteCount, epcStr);


      uint8_t shift;
      time_t timestamp;
      time_t seconds;
      int micros;
      char* timeEnd;
      char* end;

      shift = 32;
      timestamp = ((time_t)trd.timestampHigh<<shift) | trd.timestampLow;
      seconds = timestamp / 1000;
      micros = (timestamp % 1000) * 1000;
    
      /*
       * Timestamp already includes millisecond part of dspMicros,
       * so subtract this out before adding in dspMicros again
       */
      micros -= trd.dspMicros / 1000;
      micros += trd.dspMicros;

      timeEnd = timeStr + sizeof(timeStr)/sizeof(timeStr[0]);
      end = timeStr;
      end += strftime(end, timeEnd-end, "%FT%H:%M:%S", localtime(&seconds));
      end += snprintf(end, timeEnd-end, ".%06d", micros);
      end += strftime(end, timeEnd-end, "%z", localtime(&seconds));


    //printf("EPC:%s ant:%d count:%d Time:%s rssi: %d\n", epcStr, trd.antenna, trd.readCount, timeStr,trd.rssi);
  struct rfid
  {
    int rssi;
    char epc[128];
 
   }rfid;

  rfid.rssi = trd.rssi;
  strcpy(rfid.epc,epcStr);

  printf("%s,%d,", rfid.epc, rfid.rssi);

  }
}


