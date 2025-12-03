FROM eclipse-temurin:21-jdk
COPY . .
RUN curl https://sh.rustup.rs -sSf -y | sh

RUN chmod +x main.sh
CMD ["./main.sh"]