FROM alpine:3.6
MAINTAINER Edward Cox <edward.cox@meetupcall.com>

WORKDIR /tmp/ffmpeg

RUN apk update && apk upgrade && apk add --update build-base git curl nasm tar bzip2 zlib-dev yasm-dev lame-dev libogg-dev x264-dev libvpx-dev \
 libvorbis-dev x265-dev freetype-dev libass-dev libwebp-dev rtmpdump-dev libtheora-dev opus-dev \ 
 opencl-icd-loader opencl-icd-loader-dev opencl-headers ffmpeg && rm -rf /var/cache/apk/*

ENTRYPOINT ["ffmpeg"]
WORKDIR /
