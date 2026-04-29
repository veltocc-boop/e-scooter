FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy project files
COPY . .

# Expo needs this to avoid interactive prompts
ENV CI=true

# Expose port Fly expects
EXPOSE 8080

# Start Expo in non-interactive mode
CMD ["npx", "expo", "start", "--host", "0.0.0.0", "--port", "8080", "--non-interactive"]
