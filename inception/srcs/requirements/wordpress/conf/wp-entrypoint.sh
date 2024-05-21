#!/bin/sh

if ! $(wp core is-installed); then
	wp core install --url="https://127.0.0.1" --title="Wordpress" --admin_user="${DB_USER}" --admin_password="${DB_PASS}" --admin_email="${DB_MAIL}" 
	wp user create ${NEW_USER} ${NEW_MAIL} --role=author --user_pass=${NEW_PASS} --allow-root

	wp theme install zeever --activate --allow-root
	wp plugin install wp-redis --activate --allow-root
	wp wp-redis enable --allow-root
fi

php-fpm81 -F
