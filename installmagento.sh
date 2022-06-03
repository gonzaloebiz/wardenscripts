wget http://pubfiles.nexcess.net/magento/ce-packages/magento2-with-samples-magentoversion.tar.gz
tar xvzf magento2-with-samples-magentoversion.tar.gz
chmod +x bin/magento
bin/magento setup:install --db-host=db --db-name=magento --db-user=magento --db-password=magento --admin-firstname=Gonzalo --admin-lastname=Dominguez --admin-email=gonzalo@ebizmarts.com --admin-user=admin --admin-password=q1w2e3r4 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1 --backend-frontname=demoadmin --session-save=redis --session-save-redis-host=redis --session-save-redis-port=6379 --session-save-redis-db=2 --session-save-redis-max-concurrency=20 --cache-backend=redis --cache-backend-redis-server=redis --cache-backend-redis-db=0 --cache-backend-redis-port=6379 --page-cache=redis --page-cache-redis-server=redis --page-cache-redis-db=1 --page-cache-redis-port=6379
bin/magento config:set --lock-env web/unsecure/base_url "https://${TRAEFIK_SUBDOMAIN}.${TRAEFIK_DOMAIN}/"
bin/magento config:set --lock-env web/secure/base_url "https://${TRAEFIK_SUBDOMAIN}.${TRAEFIK_DOMAIN}/"
bin/magento config:set --lock-env web/secure/use_in_frontend 1
bin/magento config:set --lock-env web/secure/use_in_adminhtml 1
bin/magento config:set --lock-env web/seo/use_rewrites 1
bin/magento indexer:reindex
bin/magento -f setup:static-content:deploy
bin/magento cache:flush
