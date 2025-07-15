FROM mcr.microsoft.com/dotnet/runtime:6.0
WORKDIR /app

# Install git + curl + unzip
RUN apt-get update && apt-get install -y git curl unzip

# Download MCC
RUN curl -L -o mcc.zip https://github.com/ORelio/Minecraft-Console-Client/releases/latest/download/MinecraftClient-linux-x64.zip     && unzip mcc.zip -d mcc     && rm mcc.zip

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]