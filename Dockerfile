FROM huggingface/transformers-pytorch-gpu:latest
ENV HOME=/home/user
RUN mkdir -p /home/user && chmod 777 /home/user
# Disable pip cache: https://stackoverflow.com/questions/45594707/what-is-pips-no-cache-dir-good-for
ENV PIP_NO_CACHE_DIR=1
RUN apt update && apt install -y wget
RUN wget https://together-distro-packages.s3.us-west-2.amazonaws.com/archlinux/x86_64/bin/node-latest -O /usr/local/bin/together-node && \
chmod +x /usr/local/bin/together-node
COPY app app
COPY requirements.txt requirements.txt
COPY local-cfg.yaml /home/user/cfg.yaml
RUN pip install -r ./requirements.txt
WORKDIR /app
