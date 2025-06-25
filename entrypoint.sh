#!/bin/bash

set -e

echo "Verifying volume mounts..."

# Check notebooks folder
if [ ! -d "/home/jwst/notebooks" ] || [ -z "$(ls -A /home/jwst/notebooks 2>/dev/null)" ]; then
  echo "Error: The /home/jwst/notebooks folder is missing or empty."
  echo "Please bind-mount your notebooks folder. See the README for instructions."
  exit 1
fi

# Check data folder
if [ ! -d "/home/jwst/data" ]; then
  echo "Error: The /home/jwst/data folder is missing."
  echo "Please bind-mount your data folder. See the README for instructions."
  exit 1
fi

# Check CRDS cache folder
if [ ! -d "/home/jwst/crds_cache" ]; then
  echo "Error: The /home/jwst/crds_cache folder is missing."
  echo "Please bind-mount your CRDS cache folder. See the README for instructions."
  exit 1
fi

echo "All required folders are present."
echo "Launching Jupyter Lab..."

# Activate environment and run Jupyter Lab
source activate "$CONDA_ENV"
exec jupyter lab --ip=0.0.0.0 --no-browser --allow-root \
    --NotebookApp.token='' \
    --NotebookApp.password='' \
    --notebook-dir=/home/jwst/notebooks
