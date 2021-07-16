#!/usr/bin/env bash

mc alias set deploy $MINIO_ENDPOINT $MINIO_ACCESS_KEY $MINIO_SECRET_KEY --api S3v4
echo "deploy to: $1 deploy/$2"
ls $1
mc mirror --overwrite $1 "deploy/$2"
