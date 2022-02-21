FROM php:8.0.16-fpm-alpine3.15

WORKDIR /var/www/html

# Install composer
ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Install required libs for extension builds
RUN apk add --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    curl \
    g++ \
    gcc \ 
    make \ 
    pkgconfig \
    imagemagick \
    imagemagick-dev \
    zlib \
    zlib-dev \
    libpng \ 
    libpng-dev \ 
    libwebp-dev \ 
    libjpeg \
    freetype-dev \
    libjpeg-turbo-dev \
    libcurl \
    curl-dev \
    libzip-dev \
    libxml2-dev \
    libpng \ 
    libxpm-dev \
    libcurl \ 
    autoconf

RUN pecl install \
    xdebug \
    imagick \
    redis

RUN docker-php-ext-enable \
    imagick \
    redis \ 
    xdebug

RUN docker-php-ext-configure gd \
        --enable-gd \
        --with-webp \
        --with-jpeg \
        --with-xpm \
        --with-freetype

RUN docker-php-ext-install \
    bcmath \
    calendar \
    curl \ 
    exif \
    gd \
    zip \
    pdo_mysql \ 
    soap \
    mysqli \
    xml

## Installing ffmpeg and ffprobe
RUN wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz
RUN tar -xvf ffmpeg-git-amd64-static.tar.xz
RUN mv ffmpeg-git-20220108-amd64-static /usr/local/bin/ffmpeg
RUN rm -f ffmpeg-git-amd64-static.tar.xz

# Creating Webserver User directories
RUN mkdir -p /home/www-data
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www /home/www-data

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories
RUN apk --no-cache add shadow

RUN usermod -u 1002 xfs
RUN groupmod -g 1002 xfs

RUN groupmod -g 33 www-data
RUN usermod -u 33 www-data



