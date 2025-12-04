FROM debian:stable-slim
COPY . .

RUN chmod +x main.sh
CMD ["./main.sh"]



## OLD

#FROM rust:latest
#FROM eclipse-temurin:21-jdk
#COPY . .

#RUN chmod +x main.sh
#RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
#CMD ["./main.sh"]