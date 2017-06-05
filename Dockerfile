FROM alpine:edge
MAINTAINER Edward Cox <edward.cox@meetupcall.com>

WORKDIR /tmp/ffmpeg

RUN apk update && apk upgrade && apk add --no-cache --update build-base git curl nasm tar bzip2 zlib-dev gnutls-dev yasm-dev lame-dev libogg-dev x264-dev libvpx-dev \
 libvorbis-dev x265-dev freetype-dev libass-dev libwebp-dev rtmpdump-dev libtheora-dev opus-dev \ 
 opencl-icd-loader opencl-icd-loader-dev opencl-headers && \

  DIR=$(mktemp -d) && cd ${DIR} && \
  
  git clone https://git.ffmpeg.org/ffmpeg.git && \
  cd ffmpeg && \
  ./configure \
  --enable-version3 --enable-gpl --enable-nonfree --enable-small --enable-libmp3lame --enable-libx264 --enable-libx265 --enable-libvpx --enable-libtheora --enable-libvorbis --enable-libopus --enable-libass --enable-libwebp --enable-librtmp --enable-postproc --enable-avresample --enable-libfreetype --enable-gnutls --disable-debug --enable-opencl && \
  make && make install && make distclean && \

  rm -rf ${DIR} && \
  apk del build-base curl tar bzip2 x264 nasm git && rm -rf /var/cache/apk/*

ENTRYPOINT ["ffmpeg"]
WORKDIR /
