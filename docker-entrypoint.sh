#!/bin/sh

# ENSURE /dev/video0 IS PRESENT & CHAR DEV
if [ ! -c /dev/video0 ]; then
    echo "/dev/video0 not mapped or not a character device!"
    exit 1
fi

# SUPPRESS OUTPUT IF NO DEBUG ENV VAR SET
if [ -z $DEBUG ]; then
    LOGLEVEL="-loglevel panic"
fi

ffmpeg $LOGLEVEL -f v4l2 -i /dev/video0 -vf fps=1 -strftime 1 "/frames/%s.$EXT"
