ENV=dev

php-8:
	docker build . -f ${ENV}/Dockerfile.8 -t artpapanyan/php8-base.8.1-1
	
php-81:
	docker build . -f ${ENV}/Dockerfile.81 -t artpapanyan/php8-base.8.1-1
