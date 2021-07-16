#!/usr/bin/env bash

mc alias set deploy $MINIO_ENDPOINT $MINIO_ACCESS_KEY $MINIO_SECRET_KEY --api S3v4
echo "deploy to: $1 deploy/$2"
ls $1
mc mirror --overwrite $1 "deploy/$2"
echo "URL to download"
mc share download deploy/$2/app-release.apk


curl -X POST --data-urlencode "payload={\"channel\": \"#general\", \"username\": \"webhookbot\", \"text\": \"ไฟล์ API สำหรับทดสอบ.\", \"icon_emoji\": \":rocket:\"}" https://hooks.slack.com/services/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
