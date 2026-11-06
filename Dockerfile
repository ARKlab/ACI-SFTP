FROM atmoz/sftp:debian@sha256:54efe2a6cda236d713042e17a836d970342eea5a7568e4f60800432cec4da205

LABEL maintainer="andrea.cuneo@ark-energy.eu"

COPY files/copy_keys /etc/sftp.d/
RUN chmod +x /etc/sftp.d/copy_keys
