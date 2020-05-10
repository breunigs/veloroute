FROM node:10
RUN npm install -g togpx tokml osmtogeojson
RUN mkdir /out/

COPY convert_relation.sh /convert_relation.sh

ENTRYPOINT ["/convert_relation.sh"]
