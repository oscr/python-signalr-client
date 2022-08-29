# Use an official Python runtime as a parent image
FROM python:3.10-alpine

RUN   apk update && apk add --no-cache --virtual .build-deps \
      g++ make && \
      apk del .build-deps && \
      rm -rf /var/cache/apk/*

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD example.py /app

ADD ./ /app/signal
RUN cd /app/signal && pip install -e .

# Run app.py when the container launches
CMD ["python", "-u", "example.py"]
