#!/bin/bash

cd /var/www/html

# Download wp-cli.phar if not already present
echo "Downloading WP-CLI..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

echo "Downloading WordPress Core..."
wp core download --allow-root

DB_USER=$(cat /run/secrets/db_user)
DB_USER_PASSWORD=$(cat /run/secrets/db_user_password)
WP_ADMIN_EMAIL=$(cat /run/secrets/wp_admin_email)
WP_ADMIN_USER=$(cat /run/secrets/wp_admin_user)
WP_ADMIN_PASSWORD=$(cat /run/secrets/wp_admin_password)
WP_USER_EMAIL=$(cat /run/secrets/wp_user_email)
WP_USER_NAME=$(cat /run/secrets/wp_user_name)
WP_USER_PASSWORD=$(cat /run/secrets/wp_user_password)
WP_USER_ROLE=$(cat /run/secrets/wp_user_role)

# echo "Environment variables:"
# echo "-----------------------------------"
# echo "DB_HOST: $DB_HOST"
# echo "DB_USER: $DB_USER"
# echo "DB_USER_PASSWORD: $DB_USER_PASSWORD"
# echo "DB_NAME: $DB_NAME"
# echo "WP_ADMIN_EMAIL: $WP_ADMIN_EMAIL"
# echo "WP_ADMIN_USER: $WP_ADMIN_USER"
# echo "WP_ADMIN_PASSWORD: $WP_ADMIN_PASSWORD"
# echo "WP_USER_EMAIL: $WP_USER_EMAIL"
# echo "WP_USER_NAME: $WP_USER_NAME"
# echo "WP_USER_PASSWORD: $WP_USER_PASSWORD"
# echo "WP_USER_ROLE: $WP_USER_ROLE"
# echo "-----------------------------------"

# Generate wp-config.php
echo "Generating wp-config.php..."
wp config create \
    --dbhost="$DB_HOST" \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass="$DB_USER_PASSWORD" \
    --allow-root

# Install WordPress
echo "Installing WordPress..."
wp core install \
    --url="$DOMAIN_NAME" \
    --title="$TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root

# Create WordPress user if variables are set
echo "Creating WordPress user..."
wp user create \
    "$WP_USER_NAME" "$WP_USER_EMAIL" \
    --user_pass="$WP_USER_PASSWORD" \
    --role="$WP_USER_ROLE" \
    --allow-root

# Start PHP-FPM
echo "Starting PHP-FPM..."
php-fpm7.4 -F
