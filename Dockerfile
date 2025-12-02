FROM rust:latest
RUN cargo install bore-cli
RUN bore local 14457 --to bore.pub

#FROM eclipse-temurin:21-jdk
#COPY . .
RUN chmod +x main.sh

CMD ["./main.sh"]