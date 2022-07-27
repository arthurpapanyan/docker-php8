ENV=prod
VERSION=7

php-8:
	docker build . -f ${ENV}/Dockerfile.8 -t artpapanyan/php8-base.80:${VERSION}
php-8-push:
	docker push artpapanyan/php8-base.8-${VERSION}
	
php-81:
	docker build . -f ${ENV}/Dockerfile.81 -t artpapanyan/php8-base.81:${ENV}-${VERSION}
	
php-81-push:
	docker push artpapanyan/php8-base.81-${VERSION}
