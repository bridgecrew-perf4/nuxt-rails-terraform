# Docker
build:
	docker-compose -f docker-compose.yaml build

up:
	docker-compose -f docker-compose.yaml up

down:
	docker-compose -f docker-compose.yaml down

dbset:
	docker-compose run rails db:environment:set RAILS_ENV=development

# Vue
yarninstall:
	docker-compose run front yarn install

lint:
	docker-compose run front yarn run lint

# Rails 
rails_init:
	make migratereset;
	make migrate;
	make seed;

migrate:
	docker-compose run api rails db:migrate

rollback:
	docker-compose run api rails db:rollback

migratereset:
	docker-compose run api rails db:migrate:reset

seed:
	docker-compose run api rails db:seed

seedreset:
	docker-compose run api rails db:reset

geminstall:
	docker-compose run api gem install

# ECR
nuxt_ecr_push:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com;
	docker build -t nuxt-ecr front/;
	docker tag nuxt-ecr:latest 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com/nuxt-ecr:latest;
	docker push 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com/nuxt-ecr:latest

nuxt_run:
	docker run -d -p 3000:3000 nuxt-ecr
	# docker run nuxt-ecr

rails_ecr_push:
	rm -f api/tmp/pids/server.pid;
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com;
	docker build -t rails-ecr api/;
	docker tag rails-ecr:latest 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com/rails-ecr:latest;
	docker push 667123667048.dkr.ecr.ap-northeast-1.amazonaws.com/rails-ecr:latest

rails_run:
	# docker run -d -p 8080:8080 nuxt-ecr
	docker run nuxt-ecr