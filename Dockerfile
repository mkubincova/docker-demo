# run app on Node version 18 base image
FROM node:18

# set /app as current working directory
WORKDIR /app

# copy dependecy list
COPY package*.json ./

# install (and cache) dependencies separately, so they are not reinstalled on every app change
# shell form
RUN npm install

# copy source code
COPY . .

# set environment variable in container
ENV PORT=8080

# make port accessible
EXPOSE 8080

# command to run app (can only be one)
# exec form
CMD ["npm", "start"]


# build image: docker build -t image-name:1.0 .

# run container: docker run image-name:1.0

# run container and map local port(5000) to external(8080): docker run -p 5000:8080 image-name:1.0