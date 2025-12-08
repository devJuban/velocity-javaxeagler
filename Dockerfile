FROM ubuntu:latest
#FROM rust:latest
#FROM eclipse-temurin:21-jdk
COPY . .

RUN apt-get update && apt-get upgrade -y
RUN apt-get install openjdk-21-jre -y
RUN apt-get install cargo -y
RUN cargo install bore-cli

RUN chmod +x main.sh
#RUN cargo install bore-cli
#RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
CMD ["./main.sh"]