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
RUN echo '#!/bin/sh\n\
if [ -z $CUSTOMERUID ] || [ -z $DEVICEPROFILE ]; then\n\
    echo ERROR - both CUSTOMERUID and DEVICEPROFILE environment variables must be set!\n\
    exit\n\
fi\n\
if [ ! -f /etc/init.d/ProcessController ]; then\n\
    echo First run - downloading Cove...\n\
    if [[ "$RECOVERMODE" == "1" ]]; then\n\
        filename = "mxb.run"\n\
        echo Recovery Mode selected\n\
        echo\n\
        echo Enter the following info as the installer asks for it. Note that it does not use the same nomenclature as the web dashboard.\n\
        echo Device name: Device Name\n\
        echo Password: Installation Key\n\
        echo Security Code: Passphrase\n\
        echo\n\
    else\n\
        filename = "swibm#$CUSTOMERUID#$DEVICEPROFILE#.run"\n\
    fi\n\
    curl -o $filename https://cdn.cloudbackup.management/maxdownloads/mxb-linux-x86_64.run\n\
    chmod +x $filename\n\
    ./$filename\n\
fi\n\
service ProcessController start\n\
while true; do sleep 60; done\n\' > /app/startup.sh

RUN chmod +x /app/startup.sh

CMD /app/startup.sh
