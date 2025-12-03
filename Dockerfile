FROM rust:latest
#FROM eclipse-temurin:21-jdk
COPY . .
RUN cargo install bore-cli
RUN curl https://sh.rustup.rs -sSf | sh

RUN chmod +x main.sh
CMD ["./main.sh"]