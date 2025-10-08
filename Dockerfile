# Use the official Node.js image as the base image
FROM --platform=linux/amd64 node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Alpine uses 'apk add' instead of 'apt-get install'.
RUN apk update && \
    apk add --no-cache \
    curl \
    nano \
    bash

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app
CMD ["node", "index.js"]
