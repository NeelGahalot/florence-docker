FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-runtime

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /teamspace/studios/florence_studio

# ✅ Install required system packages
RUN apt-get update && apt-get install -y \
    git \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# ✅ Python dependencies
COPY florence_venv_requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r florence_venv_requirements.txt

Run pip install einops
# Optional: install anything specific to Florence
# e.g. any additional repo or local pip install
# RUN pip install git+https://github.com/microsoft/Florence.git

COPY . .

CMD ["python3"]


