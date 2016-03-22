#common makefile rules
depon-libs := $(shell md="$(MODULE_DEPONS)"; al=""; for i in $$md; do al="$$i $$al"; done; echo $$al)
LOCAL_LIBS := $(depon-libs) $(LOCAL_LIBS)
MODULE_DEPONS_BUILD := $(foreach depon, $(MODULE_DEPONS), $(depon)-build)
MODULE_DEPONS_CLEAN := $(foreach depon, $(MODULE_DEPONS), $(depon)-clean)

.PHONY: _begin clean doclean $(MODULE_DEPONS_BUILD) $(MODULE_DEPONS_CLEAN)
build: _begin $(MODULE_OUTPUT)/$(MODULE_TARGET);

# especially for LINUX GNU make to tracking header file 
MODULE_DEPS := $(patsubst %.o,%.d,$(MODULE_OBJ))
-include $(MODULE_DEPS)

_begin: $(MODULE_DEPONS_BUILD)
	@sh $(SCRIPTS-DIR)/check-dir.sh -f "$(MODULE_OBJ)"

$(MODULE_DEPONS_BUILD):
	@depon=`echo ${dir $@} | sed -e 's:\(\.*\)\(/\)$$:\1:'`;	\
	depon=`dirname $$depon`; $(MAKE) -C $$depon build

$(MODULE_OUTPUT)/$(MODULE_SO):	$(MODULE_OBJ) $(LOCAL_LIBS)
ifeq "$(CC_TYPE)" "forte"
	$(CCC) -G -h $(MODULE_SO) $(CXXFLAGS) -o $@ $(MODULE_OBJ) $(LOCAL_LIBS) $(LIBS)
else
#ifeq "$(HOST_TYPE)" "AIX"
#		$(CCC) -qmkshrobj -WI,soname,$(MODULE_SO) -o $@ $(MODULE_OBJ) $(LOCAL_LIBS) $(LIBS)
#else
	$(CCC) -shared -Wl,-soname,$(MODULE_SO) $(CXXFLAGS) $(LOCAL_FLAGS) -o $@ $(MODULE_OBJ) $(LOCAL_LIBS) $(LIBS)
#endif
endif

$(MODULE_OUTPUT)/$(MODULE_EXEC):$(MODULE_OBJ) $(LOCAL_LIBS)
	$(CCC) $(CXXFLAGS) -o $@ $(MODULE_OBJ) $(LOCAL_LIBS) $(LIBS)
	@cp $(MODULE_OUTPUT)/$(MODULE_EXEC) $(BASEDIR-BIN)/$(MODULE_EXEC)
	@echo
	@echo $(MODULE_EXEC) build success!
	@echo

$(MODULE_OUTPUT)/$(MODULE_LIB):	$(MODULE_OBJ) $(LOCAL_LIBS)
	$(AR) $@ $(MODULE_OBJ) $(LOCAL_LIBS)

$(MODULE_OUTPUT)/%.o : $(MODULE_DIR)/%.cxx
ifeq "$(CC_TYPE)" "forte"
	$(CCC) -c $(CXXFLAGS) $(LOCAL_FLAGS) -o $@ $< > $(patsubst %.o,%.d,$@)
else
	$(CCC) -c $(CXXFLAGS) $(LOCAL_FLAGS) -o $@ $<
endif
	
$(MODULE_OUTPUT)/%.o : $(MODULE_DIR)/%.cpp
ifeq "$(CC_TYPE)" "forte"
	$(CCC) -c $(CXXFLAGS) $(LOCAL_FLAGS) -o $@ $< > $(patsubst %.o,%.d,$@)
else
	$(CCC) -c $(CXXFLAGS) $(LOCAL_FLAGS) -o $@ $<
endif
	
$(MODULE_OUTPUT)/%.o : $(MODULE_DIR)/%.c
ifeq "$(CC_TYPE)" "forte"
	$(CC) -c $(CFLAGS) $(LOCAL_FLAGS) -o $@ $< > $(patsubst %.o,%.d,$@)
else
#ifeq "$(HOST_TYPE)" "AIX"
#		$(CC) -Ms -c $(CFLAGS) $(LOCAL_FLAGS) -o $@ $<
#else
	$(CC) -c $(CFLAGS) $(LOCAL_FLAGS) -o $@ $<
#endif
endif

clean: doclean $(MODULE_DEPONS_CLEAN) ;

$(MODULE_DEPONS_CLEAN):
	@depon=`echo ${dir $@} | sed -e 's:\(\.*\)\(/\)$$:\1:'`;	\
	depon=`dirname $$depon`; $(MAKE) -C $$depon clean

doclean:
	@$(RM) $(MODULE_OUTPUT)/$(MODULE_TARGET) $(MODULE_OBJ) $(MODULE_DEPS)
ifeq "$(CC_TYPE)" "forte"
	@$(CCADMIN) -clean -d"$(MODULE_OUTPUT)"
endif
