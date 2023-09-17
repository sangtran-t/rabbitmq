FROM rabbitmq:3.12-management

# Metadata as labels
LABEL maintainer="sangtran"
LABEL version="1.0"
LABEL description="RabbitMQ container"

# Copy configuration files
COPY configs/rabbitmq.conf /etc/rabbitmq/
COPY configs/rabbitmq-env.conf /etc/rabbitmq/

# Set permissions for RabbitMQ config files
RUN chown -R rabbitmq:rabbitmq /etc/rabbitmq

# Set environment variables
ENV RABBITMQ_CONF_ENV_FILE=/etc/rabbitmq/rabbitmq-env.conf

# Expose ports
EXPOSE 5672 15672

# Switch to 'rabbitmq' user
USER rabbitmq