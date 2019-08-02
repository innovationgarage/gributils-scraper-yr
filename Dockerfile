FROM ubuntu:19.04

RUN apt update
RUN apt install -y curl

ADD scrape.sh /scrape.sh

CMD ["/scrape.sh"]
