#FROM ubuntu:latest AS build
#
#RUN apt-get update
#RUN apt-get install openjdk-17-jdk -y
#COPY . .
#
#RUN apt-get install maven -y
#RUN mvn clean install
#
#FROM openjdk:17-jdk-slim
#
#EXPOSE 8080
#
#COPY --from=build /target/bootcamp-1.0.0.jar app.jar
#
#ENTRYPOINT ["java", "-jar", "app.jar"]

# Estágio 1: Build da aplicação
# Usa uma imagem base com o JDK e Maven
FROM maven:3.8.2-openjdk-17 AS builder

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de configuração do Maven e o código-fonte
COPY pom.xml .
COPY src ./src

# Empacota a aplicação. O build do Maven não vai tentar se conectar ao DB aqui.
RUN mvn clean package -Dmaven.test.skip=true

# Estágio 2: Criação da imagem final de execução
# Usa uma imagem base leve com apenas o JRE
FROM openjdk:17-jdk-slim

# Define o diretório de trabalho
WORKDIR /app

# Copia o arquivo .jar compilado do estágio de build para a imagem final
COPY --from=builder /app/target/bootcamp-1.0.0.jar app.jar

# Expõe a porta que a aplicação irá utilizar
EXPOSE 8080

# Comando para rodar a aplicação quando o container for iniciado
# A aplicação irá ler as variáveis de ambiente do Render neste momento
ENTRYPOINT ["java", "-jar", "app.jar"]