FROM eclipse-mosquitto:latest

# Define os argumentos para usuário e senha
ARG USERNAME
ARG PASSWORD

# Adiciona as configurações diretamente no contêiner
RUN echo "listener 1883" > /mosquitto/config/mosquitto.conf && \
    echo "allow_anonymous true" >> /mosquitto/config/mosquitto.conf && \
    echo "listener 9001" >> /mosquitto/config/mosquitto.conf && \
    echo "protocol websockets" >> /mosquitto/config/mosquitto.conf && \
    echo "allow_anonymous true" >> /mosquitto/config/mosquitto.conf && \
    mosquitto_passwd -c -b /mosquitto/config/passwd $USERNAME $PASSWORD && \
    echo "password_file /mosquitto/config/passwd" >> /mosquitto/config/mosquitto.conf

# Expondo as portas necessárias
EXPOSE 1883
EXPOSE 9001