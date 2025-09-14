FROM node:alpine

RUN apk add --update --no-cache chromium git

RUN mkdir /resumed

WORKDIR /resumed

# Tell Puppeteer to skip downloading Chromium, as we installed it via APK
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Copy the wrapper script into the container and make it executable
COPY chromium-wrapper.sh /usr/local/bin/chromium-wrapper.sh

RUN chmod +x /usr/local/bin/chromium-wrapper.sh

# Set the Puppeteer executable path to our new wrapper script
ENV PUPPETEER_EXECUTABLE_PATH=/usr/local/bin/chromium-wrapper.sh

# Initialize a package.json file, install resumed locally
RUN npm init -y && \
    npm install \
        resumed \
        puppeteer \
        jsonresume-theme-even

# RUN npm install \
#         jsonresume-theme-modern \
#         jsonresume-theme-classy \
#         jsonresume-theme-straightforward \
#         jsonresume-theme-francais \
#         jsonresume-theme-ace \
#         jsonresume-theme-lucide \
#         jsonresume-theme-kendall \
#         jsonresume-theme-jacrys \
#         jsonresume-theme-macchiato \
#         jsonresume-theme-rickosborne \
#         jsonresume-theme-stackoverflow \
#         jsonresume-theme-actual \
#         jsonresume-theme-caffeine

ENTRYPOINT ["./node_modules/.bin/resumed"]

CMD ["--help"]
