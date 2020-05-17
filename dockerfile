FROM debian:buster-slim

WORKDIR /etc/boinc-client

RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list
RUN apt update
RUN apt install -y --no-install-recommends boinc-client-opencl boinc-client
RUN apt install -y --no-install-recommends boinctui screen

# Cleaning up
RUN apt autoremove -y

# Global environment settings
ENV BOINC_GUI_RPC_PASSWORD="123" \
    BOINC_REMOTE_HOST="127.0.0.1" \
    BOINC_CMD_LINE_OPTIONS=""

# BOINC RPC port
EXPOSE 31416

# COPY BOOT SCRIPT
RUN mkdir /opt/boinc
COPY boot.sh /opt/boinc
RUN chmod +x /opt/boinc/boot.sh

ENTRYPOINT [ "/opt/boinc/boot.sh" ]