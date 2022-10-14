FROM i386/debian:stable as build
RUN apt update  && apt-get install -y wget bzip2
RUN wget https://dedcon.simamo.de/bin/dedcon-i686-pc-linux-gnu-1.6.0.tar.bz2 && tar xvjf dedcon-i686-pc-linux-gnu-1.6.0.tar.bz2 -C /

FROM i386/debian:stable-slim 
RUN mkdir /server
WORKDIR /server
COPY --from=build /dedcon-i686-pc-linux-gnu-1.6.0/dedcon /server/dedcon
CMD ["/server/dedcon"]
