FROM debian:buster-slim
RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list
RUN apt update
RUN apt install -y --no-install-recommends boinc-client-opencl boinc-client
RUN apt install -y --no-install-recommends boinctui screen
RUN apt autoremove -y

# Global environment settings
ENV BOINC_GUI_RPC_PASSWORD="123" \
    BOINC_REMOTE_HOST="127.0.0.1" \
    BOINC_CMD_LINE_OPTIONS="" \

EXPOSE 31416

WORKDIR /etc/boinc-client
COPY boot.sh .
RUN chmod +x ./boot.sh
ENTRYPOINT [ "./boot.sh" ]