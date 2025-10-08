# Use the official Node.js image as the base image
FROM --platform=linux/amd64 node:18-alpine

# Set the working directory inside the container
WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    nano \
    bash && \
    # Clean up to keep the image size small
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]
