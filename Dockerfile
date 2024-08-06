FROM php:7.4-apache

# Install PHP extensions and other dependencies
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libonig-dev \
    libzip-dev \
    && docker-php-ext-install -j$(nproc) mysqli pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
# Copy Apache configuration
COPY apache.conf /etc/apache2/conf-available/

# Enable the configuration
RUN a2enconf apache.conf


# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy application files
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html
