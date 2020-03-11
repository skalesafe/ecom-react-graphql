FROM timbru31/node-alpine-git
ENV NODE_ENV development

#RUN rmdir /usr/project
RUN mkdir /usr/project 
RUN cd /usr/project 
EXPOSE 443

RUN cd /usr/project && git clone https://github.com/skalesafe/ecom-react-graphql.git
WORKDIR /usr/project/ecom-react-graphql
RUN cd /usr/project/ecom-react-graphql/server && npm install --silent

EXPOSE 27017
EXPOSE 1337
EXPOSE 8080

ENV LOCALHOST=skale

CMD echo $LOCALHOST && cd server && npm run develop
