# cove-docker
Cove / N-Able backup agent, Installs from web
Based on Debian Bookworm

On first run, this image will download the latest backup agent from Cove.

For a new setup, you must provide CUSTOMERUID and DEVICEPROFILE as environment variables. 
To run interactive recovery mode, leave both variables unset.

