# Install dependencies dan toolkit GPU
apt update && apt install -y \
  python3 python3-pip python3-venv \
  git curl cmake build-essential ninja-build \
  libopenblas-dev python3-dev \
  nvidia-cuda-toolkit autoconf libtool

# Buat virtualenv
python3 -m venv /app/venv
source /app/venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# ✅ Build llama-cpp-python with GPU (NEW FLAG)
CMAKE_ARGS="-DGGML_CUDA=on" pip install llama-cpp-python --force-reinstall --no-binary :all:

# Install FastAPI + uvicorn
pip install fastapi uvicorn
