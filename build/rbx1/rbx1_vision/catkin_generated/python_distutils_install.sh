#!/bin/sh

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

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/turtlebot/xu_slam/src/rbx1/rbx1_vision"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/turtlebot/xu_slam/install/lib/python2.7/dist-packages:/home/turtlebot/xu_slam/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/turtlebot/xu_slam/build" \
    "/usr/bin/python" \
    "/home/turtlebot/xu_slam/src/rbx1/rbx1_vision/setup.py" \
    build --build-base "/home/turtlebot/xu_slam/build/rbx1/rbx1_vision" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/turtlebot/xu_slam/install" --install-scripts="/home/turtlebot/xu_slam/install/bin"
