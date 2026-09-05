#!/usr/bin/env bash
# Idempotent setup for the colab_sample notebook environment.
# Creates a Python virtual environment and installs the notebook dependencies.
set -euo pipefail

cd "$(dirname "$0")/.."

# python venv support is not guaranteed in the base image.
if ! python3 -c "import ensurepip" >/dev/null 2>&1; then
  sudo apt-get update -qq
  sudo apt-get install -y -qq "python3-venv" || \
    sudo apt-get install -y -qq "python$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')-venv"
fi

if [ ! -x ".venv/bin/python" ]; then
  python3 -m venv .venv
fi

.venv/bin/python -m pip install --upgrade pip
.venv/bin/pip install -r requirements.txt

# Register a Jupyter kernel backed by the virtual environment so the notebook
# can be executed with `jupyter nbconvert --execute` or opened in Jupyter Lab.
.venv/bin/python -m ipykernel install --user \
  --name colab_sample --display-name "Python (colab_sample)"

echo "Environment ready. Activate with: source .venv/bin/activate"
