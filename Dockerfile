FROM node:20

WORKDIR /app

# Copy package files first to leverage Docker's layer cache.
# This layer is only rebuilt when package.json or package-lock.json changes.
COPY package*.json ./

RUN npm install

# Now copy the rest of the application source code.
COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev", "--", "--host"]
