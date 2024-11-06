FROM python:3.11.0
EXPOSE 5000
COPY ./src/requirements.txt .
RUN python -m pip install -r requirements.txt
WORKDIR /app
COPY ./src /app
RUN chmod +x /app/entrypoint.sh
ENV PROMETHEUS_MULTIPROC_DIR=/tmp/metrics
RUN mkdir -p /tmp/metrics 
CMD ["/app/entrypoint.sh"]