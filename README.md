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

### 1. Get the Docker Image

To download the Docker Image containing our Eureka! installation and our notebooks, follow one of these methods:

#### Option A: Use Docker Desktop GUI (if supported)
- Open Docker Desktop
- Click on the **Search** bar at the top
- Type `ultrahot/exoslam2025_eureka` and press **Enter**
- If you don’t see the image in the search results, make sure you're logged into Docker Hub via Docker Desktop.
- Once the image appears, click Pull to download it.

#### Option B: Use the Terminal
- Open your terminal or command prompt
- Run the following command:
  ```bash
  docker pull ultrahot/exoslam2025_eureka:latest
  ```

Once downloaded, the image will appear in Docker Desktop under the **Images** tab and then you're ready to launch it.

---

### 2. Run the Container

After pulling the image, click the **Run** play button, and then follow these steps **carefully**:

#### Set Container Name

Before launching the container, it's a good idea to give it a recognizable name so you can easily manage it later (e.g., restarting or deleting it).

In the **"Container name"** field, enter a useful name like `exoslam2025`. This name will help you identify the container in Docker Desktop, especially if you're running more than one.


#### Set Ports
- Click **"Optional Settings"** (sometimes labeled **"Port Settings"**) → **"Port Mapping"**
- Add the following mapping:
  ```
  Host:      8888
  Container: 8888 (this should already be set for you)
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

You can safely ignore the Environment variables section of the Optional Settings.

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

## 4. Required Before the Workshop

After you've launched the container and opened JupyterLab in your browser, please open and run the `0_Setup_Notebook.ipynb` notebook.
This notebook will automatically download the required JWST `_uncal.fits` data files.

⚠️ **Important:** The workshop venue may have slow internet access. Downloading the data in advance is very strongly recommended.

---

## Tips

- You don’t need a Jupyter password or token — access is open by default
- Files saved in `notebooks/`, `crds_cache/`, and `data/` will persist on your machine
- Restart the container anytime using Docker Desktop

---

## Support

Having trouble? Reach out to your instructor or submit a [GitHub Issue](https://github.com/taylorbell57/ExoSLAM2025_Eureka/issues).
