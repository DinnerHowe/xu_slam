#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/turtlebot2/xu_slam/src/rbx1/rbx1_nav"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/turtlebot2/xu_slam/install/lib/python2.7/dist-packages:/home/turtlebot2/xu_slam/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/turtlebot2/xu_slam/build" \
    "/usr/bin/python" \
    "/home/turtlebot2/xu_slam/src/rbx1/rbx1_nav/setup.py" \
    build --build-base "/home/turtlebot2/xu_slam/build/rbx1/rbx1_nav" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/turtlebot2/xu_slam/install" --install-scripts="/home/turtlebot2/xu_slam/install/bin"