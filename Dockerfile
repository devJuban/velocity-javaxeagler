FROM ubuntu:stable
#FROM rust:latest
#FROM eclipse-temurin:21-jdk
COPY . .

RUN apt-get install python3 -y

RUN chmod +x main.sh
#RUN cargo install bore-cli
#RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
CMD ["./main.sh"]