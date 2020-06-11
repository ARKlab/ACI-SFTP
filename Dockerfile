FROM atmoz/sftp

LABEL maintainer="andrea.cuneo@ark-energy.eu"

COPY files/copy_keys /etc/sftp.d/
RUN chmod +x /etc/sftp.d/copy_keys
