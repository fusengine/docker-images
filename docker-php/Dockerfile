FROM ubuntu
MAINTAINER Fusengine <info@fusengine.ch>

RUN apt-get update && apt-get install -y apache2

# Expose port
EXPOSE 80

# Start Apache2 script
CMD apache2 -D FOREGROUND



