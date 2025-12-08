FROM ubuntu:latest
#FROM rust:latest
#FROM eclipse-temurin:21-jdk
COPY . .

RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get install python3 -y

RUN chmod +x main.sh
#RUN cargo install bore-cli
#RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
CMD ["./main.sh"]