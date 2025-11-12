#!/bin/bash
# Deploy the site
sudo rm -Rf /var/www/html/dev
sudo cp -R ./_site /var/www/html/dev
sudo chown -R www-data:www-data /var/www/html/dev
sudo chmod -R 755 /var/www/html/dev
echo "Deployment to /var/www/html/dev completed."