FROM huggingface/transformers-pytorch-gpu:latest
ENV HOME=/home/user
RUN apt install wget -y
RUN wget https://together-distro-packages.s3.us-west-2.amazonaws.com/archlinux/x86_64/bin/node-latest -O /usr/local/bin/together-node && \
chmod +x /usr/local/bin/together-node
COPY app app
RUN pip install -r /requirements.txt
WORKDIR /app
