# Dockerfile for Node.js backend
FROM node:16-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY backend/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY backend/ ./

# Expose the backend port
EXPOSE 3000

# Start the Node.js app
CMD ["npm", "start"]
