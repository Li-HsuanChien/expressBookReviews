# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the local project files into the container at /app
COPY . /app

# Navigate to the project directory
WORKDIR /app/book_review_app

# Install required dependencies
RUN npm install

# Expose the port that the app will run on
EXPOSE 5000

# Run the application
CMD ["npm", "start"]
