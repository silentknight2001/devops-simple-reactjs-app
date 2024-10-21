FROM node:14 AS build 

WORKDIR /usr/src/app 
COPY package.*json ./
RUN npm install
COPY . .


FROM node:14 AS runtime 
WORKDIR /usr/src/app 
COPY --from=build /usr/src/app ./
CMD [ "npm",'start' ]