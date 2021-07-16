# Minio Upload and Slack Notify

- Run [minio client][] in GitHub Actions to deploy files to Minio object storage. 
- Get uploaded url
- Send notification to slack. 

It uses the `mc mirror --overwrite` command to deploy.

## Usage

Put the following step in your workflow:

```yml
- name: Minio Deploy
uses: iamapinan/minio-upload-and-slack-notify@v1.9
with:
  endpoint: ${{ secrets.MINIO_ENDPOINT }}
  access_key: ${{ secrets.MINIO_ACCESS_KEY }}
  secret_key: ${{ secrets.MINIO_SECRET_KEY }}
  bucket: 'mybucket'
  # Optional inputs with their defaults:
  source_dir: 'public'
  target_dir: '/'
  file: 'app-release.apk'
  slack_hook: ${{ secrets.SLACK_HOOK }}
  slack_msg: "send builded file for test here is download info"
  slack_botname: "Notify"
```

Workflow example:

```yml
name: Deploy

on:
  pull_request:
    types: [opened, synchronize]
  push:
    branches:
      - master

jobs:
  build:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1

      - name: Minio Deploy
        uses: iamapinan/minio-upload-and-slack-notify@v1.9
        with:
          endpoint: ${{ secrets.MINIO_ENDPOINT }}
          access_key: ${{ secrets.MINIO_ACCESS_KEY }}
          secret_key: ${{ secrets.MINIO_SECRET_KEY }}
          bucket: 'mybucket'
          source_dir: 'public'
          target_dir: '/'
          file: 'app-release.apk'
          slack_hook: ${{ secrets.SLACK_HOOK }}
          slack_msg: "send builded file for test here is download info"
          slack_botname: "Notify"
```

## License

Licensed under the MIT license. See [LICENSE](LICENSE).

[minio client]: https://docs.min.io/docs/minio-client-quickstart-guide
