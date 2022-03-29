## PHP fpm 8.0 alpine image with preconfigured extensions
### Extensions
- Composer
- Redis
- Imagick
- RdKafka
- pdo_mysql \
    bcmath \
    calendar \
    curl \
    exif \
    gd \
    zip \
    pdo_mysql \
    soap \
    mysqli \
    xml \
    redis
- Ffmpeg binaries
- preconfigured user for web server

## Build instructions 
```
docker build . -t your/tagname:latest
```
As a server
```
docker run -p 9000:9000 your/tagname:latest
```

## Current Tags
```
artpapanyan:php8-base
artpapanyan:php81-base
```