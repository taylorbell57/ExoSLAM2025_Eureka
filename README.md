# JWST Data Analysis Tutorial

Welcome to the JWST Data Analysis Tutorial using Eureka!, Docker, and JupyterLab. This guide will walk you through how to get started on **Windows, macOS (Intel & Apple Silicon), or Linux** with no coding setup required.

---

## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop) installed and running
- ~15 GB free disk space
- Internet access

---

## Folder Structure

Before launching the container, organize your files like this on your machine:

```
eureka_tutorial/
├── notebooks/          # Jupyter notebooks
├── crds_cache/         # CRDS reference files will be cached here automatically
└── data/               # Data inputs and outputs will be located within here
```

Make sure the folder names match exactly — they’ll be mounted into the container.

---

## Step-by-Step: Using Docker Desktop (GUI)

### 1. Pull the Docker Image

- Open Docker Desktop
- Go to the **Images** tab
- Click **Pull**
- Enter the image name:
  ```
  taylorbell57/exoslam2025_eureka:latest
  ```

---

### 2. Run the Container

After pulling the image, click **Run**, then follow these steps **carefully**:

#### Set Ports
- Click **"Optional Settings"** (sometimes labeled **"Port Settings"**) → **"Port Mapping"**
- Add the following mapping:
  ```
  Host:      8888
  Container: 8888
  ```
  This allows you to access Jupyter in your browser.

### Set Volume Mounts

- Click **"Optional Settings" → "Volume Mapping"**
- Click the **"+" button** to add each of the three required mounts.
- For each mount below, click the **“...” button** in the Host path text box to **browse to the correct folder on your machine**.
- For each mount below, exactly copy-paste the Container path from the table below

| Click “...” to select this folder on your computer     | Container path                 |
|--------------------------------------------------------|--------------------------------|
| `eureka_tutorial/notebooks`                            | `/home/jwst/notebooks`         |
| `eureka_tutorial/data`                                 | `/home/jwst/data`              |
| `eureka_tutorial/crds_cache`                           | `/home/jwst/crds_cache`        |

> **Important:** Make sure you're selecting the actual folder — not typing or pasting paths — to avoid issues. The folder must exist before launching.

Once you have that all specified, then click **Run**.

---

### 3. Open JupyterLab

Once the container starts:

- Open your browser to:
  ```
  http://localhost:8888/lab
  ```

- Your content will be accessible under:
  - `/home/jwst/notebooks` (your notebooks)
  - `/home/jwst/data` (input and output data files)
  - `/home/jwst/crds_cache` (JWST reference files)

JupyterLab may take a few seconds to load on first launch.

---

## Tips

- You don’t need a Jupyter password or token — access is open by default
- Files saved in `notebooks/`, `crds_cache/`, and `data/` will persist on your machine
- Restart the container anytime using Docker Desktop

---

## Support

Having trouble? Reach out to your instructor or submit a [GitHub Issue](https://github.com/taylorbell57/ExoSLAM2025_Eureka/issues).
