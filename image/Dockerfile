FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

EXPOSE 5000

RUN apt-get update && apt-get upgrade
RUN apt-get -y install curl locales locales-all

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

COPY startup.sh /app/startup.sh

RUN chmod +x /app/startup.sh

CMD /app/startup.sh


