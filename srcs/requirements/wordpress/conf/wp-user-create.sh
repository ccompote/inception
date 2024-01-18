echo "INFO: Downloading CLI..."

curl -o /usr/local/bin/wp -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp

echo "INFO: CLI done"

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
echo "INFO: MAKING CONFIG..."
    wp config create --dbname="${DB_NAME}" \
                    --dbuser="${DB_USER}" \
                    --dbpass="${DB_PASS}" \
                    --dbhost="${DB_NAME}" \
                    --path="/var/www/html" \
                    --force \
                    --skip-check \
                    --allow-root
echo "INFO: MADE CONFIG"
fi

echo "INFO: Installing WordPress..."
while ! wp core install --allow-root \
        --url="pgorner.42.fr" \
        --title="Inception" \
        --admin_user="${DB_ROOT}" \
        --admin_password="${DB_ROOT}" \
        --admin_email="test@test.de"
do
    echo 1>&2 "Wordpress: Waiting for database ..."
    sleep 1
done
echo "INFO: Installed WordPress"

echo "-------------------------------------------------"

if ! wp user list --allow-root | grep -q "DB_USER"; then
    echo "INFO: Setting up ${DB_USER}"
    wp user create "${DB_USER}" \
                    "test@test.de" \
                    --user_pass="${DB_PASS}" \
                    --allow-root
else
    echo "INFO: ${DB_USER} has already been set up"
fi
