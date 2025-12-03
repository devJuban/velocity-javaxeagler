FROM rust:latest
COPY . .
RUN cargo install bore-cli

RUN chmod +x main.sh
CMD ["./main.sh"]