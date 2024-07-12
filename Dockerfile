FROM python:3.9-slim

WORKDIR /app

# Copy the directory
COPY . $WORKDIR

RUN apt-get update && \
    apt-get install -y build-essential gcc netcat-openbsd

# Install requirements
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
