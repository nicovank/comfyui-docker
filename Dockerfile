FROM ubuntu:latest

RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y tzdata \
    && apt install -y git python3 python3-pip \
    && apt clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Comfy-Org/ComfyUI.git /root/ComfyUI

RUN python3 -m pip config set global.break-system-packages true
RUN python3 -m pip config set global.root-user-action ignore
RUN python3 -m pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu130
RUN pip install -r /root/ComfyUI/requirements.txt

ENTRYPOINT ["python3", "/root/ComfyUI/main.py", "--listen", "0.0.0.0"]
