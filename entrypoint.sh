#!/usr/bin/env bash

mc alias set deploy $MINIO_ENDPOINT $MINIO_ACCESS_KEY $MINIO_SECRET_KEY --api S3v4
echo "deploy to: $1 deploy/$2"
ls $1
mc mirror --overwrite $1 "deploy/$2"
echo "URL to download."
url=(mc share download deploy/$2/app-release.apk)
echo $url
curl -X POST --data-urlencode "payload={\"channel\": \"#general\", \"username\": \"webhookbot\", \"text\": \"ไฟล์ API สำหรับทดสอบ $url\", \"icon_emoji\": \":rocket:\"}" $SLACK_HOOK
