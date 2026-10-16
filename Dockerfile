# syntax=docker/dockerfile:1
# =============================================================================
#  Dockerfile - FILE KHUNG (multi-stage build cho Spring Boot 4 / Java 21 / Gradle)
#  Sinh viên hoàn chỉnh các ô ______ theo yêu cầu Phần 2 của đề thi.
# =============================================================================

# ---------- Stage 1: build - biên dịch & đóng gói bằng Gradle + JDK 21 ----------
# Spring Boot 4 yêu cầu Gradle >= 8.14

FROM gradle:8.14-jdk21-alpine AS build

WORKDIR /workspace

COPY build.gradle settings.gradle ./
RUN gradle dependencies --no-daemon -q

COPY src ./src
RUN gradle bootJar -x test --no-daemon -q

  # ---------- Stage 2: runtime ----------
FROM eclipse-temurin:21-jre-alpine AS runtime

ARG APP_VERSION=dev
ENV APP_VERSION=${APP_VERSION}
ENV JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=75"

WORKDIR /app

RUN addgroup -S spring && adduser -S spring -G spring

COPY --from=build --chown=spring:spring \
/workspace/build/libs/app.jar /app/app.jar

USER spring

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "/app/app.jar"]

