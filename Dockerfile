FROM node:6.9.1

MAINTAINER Iraklis Alexopoulos <ialexopo@visa.com>

# Install PM2 manager globally
RUN npm install -g pm2@2.1.6

# Add codebase to the filesystem
COPY . /var/www/html

# Set the current working directory
WORKDIR /var/www/html

# Install dependencies
RUN npm install

# Define mountable directories.
VOLUME ["/var/www/html"]

CMD ["pm2-docker", "process.yml"]

EXPOSE 3000