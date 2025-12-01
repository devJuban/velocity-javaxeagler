FROM eclipse-temurin:21-jdk
COPY . .
EXPOSE 14457
RUN chmod +x main.sh
CMD ["./main.sh"]