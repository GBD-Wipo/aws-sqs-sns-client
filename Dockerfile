FROM amazonlinux:latest
RUN yum install -y gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash -
RUN yum install -y nodejs
RUN node -v
RUN mkdir -p /data/sqs_admin/ && cd /data/sqs_admin
WORKDIR /data/sqs_admin

COPY ./ /data/sqs_admin/
RUN npm install

EXPOSE 3000
CMD ["node", "app.js"]
