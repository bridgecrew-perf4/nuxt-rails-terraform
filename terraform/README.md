rootユーザーでadminユーザーを作成


```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=
```


IAMユーザー権限があることを確認する
```
aws sts get-caller-identity
```

terraformのセットアップ
```
brew install terraform
```

```
terraform --version
```

```
brew install tfenv
```

```
tfenv --version
```
tfenv list-remote

tfenv install 0.12.5

tfenv list

tfenv use 0.12.5

echo 0.12.5 > .terraform-version

docker pull hashicorp/terraform:0.12.5

docker run --rm hashicorp/terraform:0.12.5 --version

docker run --rm -i -v $PWD:/work -w /work \
-e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
-e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
-e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
hashicorp/terraform:0.12.5

brew install git-secrets

mkdir aws

cd aws

touch main.tf

手順

Dockerimageの作成
ECRの作成
ECRにデプロイ
vpcの作成
サブネットの作成