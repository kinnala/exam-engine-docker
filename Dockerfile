FROM node:stretch
ENV DEBIAN_FRONTEND=noninteractive
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y firefox-esr google-chrome-stable
RUN useradd -ms /bin/bash ee
USER ee
RUN npm config set prefix ~/.npm
RUN npm install -g @digabi/exam-engine-cli
ENV PATH="/home/ee/.npm/bin:${PATH}"