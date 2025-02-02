# Dockerfile

# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and yarn.lock files to the working directory
COPY package.json package-lock.json .

# Install app dependencies
RUN npm install

# Copy the entire app directory to the working directory
COPY . .

# Build the app for production
# RUN npx react-native bundle --platform ios --dev false --entry-file index.js --bundle-output ios/main.jsbundle --assets-dest ios/assets
# RUN npx react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res
RUN npx expo start

# Expose port 8080 for the React Native packager
EXPOSE 3000

# Start the app
CMD ["npx", "web"]
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
