ARG FROM_IMAGE_NAME=nvcr.io/nvidia/tensorflow:19.08-py3
FROM ${FROM_IMAGE_NAME}

RUN apt update && apt install -y unzip
# Install Python dependencies
WORKDIR /workspace/fractal_graph_expansion

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
