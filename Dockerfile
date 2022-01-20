ARG BASE_IMAGE="nvcr.io/nvidia/pytorch:21.05-py3"

FROM ${BASE_IMAGE} AS base

RUN ls
RUN apt-get update #&& install ffmpeg

# if you have a requirements file, copy it then install them (cleaner option)
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt

COPY ./main.py /workspace/main.py

WORKDIR /workspace

# alternatively to install them manually
#RUN pip3 install torchmetrics \
# tensorboard \
# albumentations \
# mlflow \
# cupy