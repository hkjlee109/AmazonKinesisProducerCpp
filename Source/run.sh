#! /bin/sh

LD_LIBRARY_PATH=`pwd`/lib \
AWS_ACCESS_KEY_ID=MYAWSKEY \
AWS_SECRET_ACCESS_KEY=MYAWSSECRETKEY \
AWS_DEFAULT_REGION=eu-central-1 \
./AmazonKinesisProducerCpp MYAWSSTREAMNAME -d /dev/video-camera -w 1280 -h 720 -f 5
