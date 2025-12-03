FROM eclipse-temurin:21-jdk
COPY . .
RUN curl https://sh.rustup.rs -y -sSf | sh

RUN chmod +x main.sh
CMD ["./main.sh"]