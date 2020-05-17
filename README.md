# boinc-client
Boinc client for docker (Debian buster)

## Usage

Build the image tagged as boinc-client

```
docker image build -t boinc-client .
```

Run the container from the following docker-compose (For docker swarm)

```
version: '3.7'
services:
  main:
    image: boinc-client:latest
    ports:
      - 31416:31416
    volumes:
      - /mnt/storage/docker/boinc:/etc/boinc-client
    environment:
      BOINC_GUI_RPC_PASSWORD: 123
      BOINC_CMD_LINE_OPTIONS: --allow_remote_gui_rpc
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints: [node.role == manager]
```

## Parameters

| NAME | DESCRIPTION |
| ------------- | ------------- |
| BOINC_GUI_RPC_PASSWORD  | Use this to set the initial RPC password |
| BOINC_CMD_LINE_OPTIONS  | You can pass more options to the boinc daemon. The --allow_remote_gui_rpc option allows connecting to the client  |
| BOINC_REMOTE_HOST  | The host ip address (Optional)  |