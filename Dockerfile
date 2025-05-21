# Usando a imagem base do Gradle para compilar a aplicação
FROM gradle:8.7.0-jdk21 AS build

# Definindo diretório de trabalho e copiando o código-fonte
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src

# Executando a construção e testando, mas sem rodar os testes (evitando o uso de -x test se não for necessário)
RUN gradle build --no-daemon

# Imagem final para execução (usando OpenJDK 17)
FROM eclipse-temurin:17-jdk-alpine

# Copiando o JAR gerado para a imagem final
COPY --from=build /home/gradle/src/build/libs/*.jar /app/app.jar

EXPOSE 8080

# Configurando o ponto de entrada da aplicação
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

