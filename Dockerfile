FROM eclipse-temurin:21-jdk
FROM ekzhang/bore:latest
COPY . .
#RUN chmod +x main.sh
#RUN ./main.sh
CMD ["bore --help"]