# colab_sample
Test of udemy

A sample Google Colaboratory notebook (`github.ipynb`) demonstrating GitHub
integration. The notebook builds and trains a small Keras CNN on the CIFAR-10
dataset.

## Development environment

Requirements: Python 3 with `venv` support (`python3-venv` on Debian/Ubuntu).

Set up the environment and register a Jupyter kernel:

```bash
bash .cursor/install.sh
```

This creates a `.venv/` virtual environment, installs the dependencies from
`requirements.txt` (TensorFlow, Keras, NumPy, Matplotlib, and Jupyter tooling),
and registers a `colab_sample` Jupyter kernel.

## Running the notebook

Open it interactively with Jupyter Lab:

```bash
.venv/bin/jupyter lab github.ipynb
```

Or execute it headlessly end-to-end:

```bash
.venv/bin/jupyter nbconvert --to notebook --execute github.ipynb \
  --output github.executed.ipynb --ExecutePreprocessor.kernel_name=colab_sample
```

The first run downloads the CIFAR-10 dataset (~163 MB) and trains for one epoch
on CPU.
