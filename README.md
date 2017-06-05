(Cloned): Updated FFmpeg version and Linux build

FFmpeg was updated to compile from the git master and the alphine set to latest. Most of the config is still the same.

HOWEVER

This is now a 140MB image, rather than 109MB.

This is just the form from: https://github.com/opencoconut/ffmpeg, original README below the line.

# Minimal FFmpeg Docker image built on the latest Alpine Linux

...

Current FFmpeg version: `master`

## FFmpeg Build Configuration

```
ffmpeg version N-86343-g3385989 Copyright (c) 2000-2017 the FFmpeg developers
  built with gcc 5.3.0 (Alpine 5.3.0)
  configuration: --enable-version3 --enable-gpl --enable-nonfree --enable-small --enable-libmp3lame --enable-libx264 --enable-libx265 --enable-libvpx --enable-libtheora --enable-libvorbis --enable-libopus --enable-libass --enable-libwebp --enable-librtmp --enable-postproc --enable-avresample --enable-libfreetype --enable-openssl --disable-debug
  libavutil      55. 63.100 / 55. 63.100
  libavcodec     57. 96.101 / 57. 96.101
  libavformat    57. 72.101 / 57. 72.101
  libavdevice    57.  7.100 / 57.  7.100
  libavfilter     6. 91.100 /  6. 91.100
  libavresample   3.  6.  0 /  3.  6.  0
  libswscale      4.  7.101 /  4.  7.101
  libswresample   2.  8.100 /  2.  8.100
  libpostproc    54.  6.100 / 54.  6.100

  configuration:
    --enable-version3
    --enable-gpl
    --enable-nonfree
    --enable-small
    --enable-libmp3lame
    --enable-libx264
    --enable-libx265
    --enable-libvpx
    --enable-libtheora
    --enable-libvorbis
    --enable-libopus
    --enable-libass
    --enable-libwebp
    --enable-librtmp
    --enable-postproc
    --enable-avresample
    --enable-libfreetype
    --enable-openssl
    --disable-debug
```

## Usage

```
$ docker run opencoconut/ffmpeg -i http://files.coconut.co.s3.amazonaws.com/test.mp4 -f webm -c:v libvpx -c:a libvorbis - > test.webm
```

To encode a local file, you can mount the current path on the Docker host's filesystem as a volume inside the container like this:

```
$ docker run -v=`pwd`:/tmp/ffmpeg opencoconut/ffmpeg -i localfile.mp4 out.webm
```

You can create an alias so you use the Docker container like if FFmpeg is installed on your computer:

In `~/.bashrc`:

```
alias ffmpeg='docker run -v=`pwd`:/tmp/ffmpeg opencoconut/ffmpeg'
```

Now we can execute FFmpeg with just:

```
$ ffmpeg -buildconf
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author
Original Version from 
**Bruno Celeste**

http://coconut.co

[@OpenCoconut](http://twitter.com/OpenCoconut)

You can contact me directly on Twitter [@brunoceleste](http://twitter.com/brunoceleste)

Modification by

**Edward Cox**
