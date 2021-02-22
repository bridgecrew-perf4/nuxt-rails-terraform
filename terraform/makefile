init:
	terraform init

plan:
	terraform plan

apply:
	time terraform apply -parallelism=20 --auto-approve

destroy:
	time terraform destroy -parallelism=20 --auto-approve

fmt:
	terraform fmt -recursive

fmtcheck:
	terraform fmt -recursive -check

validate:
	terraform validate

tflint:
	tflint

check_identity:
	aws sts get-caller-identity

# log:
# 	aws ecs list-tasks \
#      --cluster nuxt-rails-cluster \
#      --desired-status STOPPED \
#      --region ap-northeast-1


# aws ecs describe-tasks \
#      --cluster nuxt-rails-cluster \
#      --tasks arn:aws:ecs:ap-northeast-1:667123667048:task/nuxt-rails-cluster/0a163dfa419c46f3af4ceb1dcd1c5efb \
#      --region ap-northeast-1

# docker_inspect:
# 	docker inspect 747201bcca0e