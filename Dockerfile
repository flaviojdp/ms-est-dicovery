# Etapa 1: Construir o JAR
FROM eclipse-temurin:21-jdk-jammy AS build
WORKDIR /app

# Copia os arquivos de configuração do Gradle primeiro para aproveitar o cache de camadas
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle .
COPY settings.gradle .

# Dá permissão de execução ao wrapper e baixa as dependências
RUN chmod +x ./gradlew
RUN ./gradlew dependencies --no-daemon

# Copia o código fonte e constrói o projeto
COPY src ./src
RUN ./gradlew bootJar -x test --no-daemon

# Etapa 2: Execução
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# O Gradle por padrão gera o jar dentro de build/libs/
#COPY --from=build /app/build/libs/*.jar app.jar
# Substitua a linha antiga por esta (ajustando para o nome do seu projeto se souber):
COPY --from=build /app/build/libs/*-SNAPSHOT.jar app.jar

EXPOSE 9001
ENTRYPOINT ["java", "-jar", "app.jar"]