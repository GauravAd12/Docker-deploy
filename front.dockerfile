# Dockerfile for frontend (React, Angular, or Vue.js, assuming React here)
FROM node:16 as build

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY frontend/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY frontend/ ./

# Build the frontend
RUN npm run build

# Use Nginx to serve the frontend
FROM nginx:alpine

# Copy the build output to the Nginx web directory
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]