FROM python:3.12.1-slim-bookworm
ADD reference/requirements.txt ./requirements.txt
RUN python3 -m pip install -r requirements.txt && \
    apt update && \
    apt install -y make && \
    apt install -y patch && \
    apt clean
