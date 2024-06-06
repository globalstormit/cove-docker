FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

EXPOSE 5000

RUN apt-get update && apt-get upgrade; apt-get -y install curl locales locales-all xmlstarlet inetutils-ping dnsutils nano vim procps

# Set Locale
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# Cove settings
ENV CUSTOMERUID=""
ENV DEVICEPROFILE=""
ENV RECOVERMODE=""

WORKDIR /app
# tail -f -n 1 $(find . -name "*.log")

COPY *.sh /app/

RUN chmod +x /app/*.sh

CMD /app/startup.sh


