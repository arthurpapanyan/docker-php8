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
### Build instructions 
```sh
// Set Env in Makefile to (dev|prod)

make php-8

```
As a server
```
docker run -p 9000:9000 your/tagname:latest
```