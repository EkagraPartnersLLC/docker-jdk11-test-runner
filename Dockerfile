FROM openjdk:11-jre-slim

USER root
RUN groupadd -g 550 appuser && useradd -r -m -u 1000 -g appuser appuser

ENV AWS_INSTALL /usr/local/aws-cli
ENV	AWS_BIN	/usr/local/bin
ENV	AWS_DOWNLOAD_URL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"

RUN  mkdir -p /tmp/dependencies
ADD ${AWS_DOWNLOAD_URL}  /tmp/dependencies/awscliv2.zip

RUN apt-get update && apt-get install unzip
RUN	unzip /tmp/dependencies/awscliv2.zip

RUN rm /tmp/dependencies/awscliv2.zip

RUN ./aws/install

RUN chmod -R 777 ${AWS_INSTALL}
RUN chmod -R 777 ${AWS_BIN}

ENV PATH $PATH:$AWS_INSTALL

USER appuser


