echo "INFO: Downloading CLI..."

curl -o /usr/local/bin/wp -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp

echo "INFO: CLI done"

echo "INFO: Installing WordPress..."
while ! wp core install --allow-root \
        --url="pgorner.42.fr" \
        --title="Inception" \
        --admin_user="${WP_ADMIN_USR}" \
        --admin_password="${WP_ADMIN_PWD}" \
        --admin_email="${WP_ADMIN_EMAIL}"
do
    echo 1>&2 "Wordpress: Waiting for database ..."
    sleep 1
done
echo "INFO: Installed WordPress"

echo "-------------------------------------------------"

if ! wp user list --allow-root | grep -q "$WP_USER_NAME"; then
    echo "INFO: Setting up ${WP_USER_NAME}"
    wp user create "${WP_USER_NAME}" \
                    "${WP_USER_EMAIL}" \
                    --user_pass="$WP_USER_PASSWORD" \
                    --allow-root
else
    echo "INFO: ${WP_USER_NAME} has already been set up"
fi
