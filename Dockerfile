FROM condaforge/mambaforge:latest

# Set working directory
WORKDIR /home/jwst

# Environment variables
ENV CRDS_PATH="/home/jwst/crds_cache"
ENV CRDS_SERVER_URL="https://jwst-crds.stsci.edu"
ENV PATH="/opt/conda/bin:$PATH"

# Use bash as default shell for consistent conda behavior
SHELL ["/bin/bash", "-c"]

# Install build tools, clone Eureka, and install into base env
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        git \
        curl && \
    git clone -b exoslam2025 https://github.com/kevin218/Eureka.git && \
    mamba install python=3.13 -y -c conda-forge && \
    pip install --no-cache-dir './Eureka/[jwst,hst,test,docs,jupyter]' && \
    rm -rf Eureka/.git && \
    apt-get purge -y build-essential && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    conda clean -afy

# Expose relevant folders and port
EXPOSE 8888
VOLUME ["/home/jwst/notebooks", "/home/jwst/data", "/home/jwst/crds_cache"]

# Metadata
LABEL org.opencontainers.image.title="ExoSLAM Eureka! Tutorial"
LABEL org.opencontainers.image.description="A Jupyter-based Docker environment for JWST data analysis using Eureka!"
LABEL org.opencontainers.image.version="0.1"
LABEL org.opencontainers.image.authors="Taylor James Bell <taylorbell57>"
LABEL org.opencontainers.image.source="https://github.com/taylorbell57/ExoSLAM2025_Eureka"
LABEL org.opencontainers.image.licenses="MIT"

# Copy entrypoint script
COPY entrypoint.sh /home/jwst/entrypoint.sh
RUN chmod +x /home/jwst/entrypoint.sh

# Set default shell to bash
ENV SHELL=/bin/bash

# Start script
ENTRYPOINT ["/home/jwst/entrypoint.sh"]
