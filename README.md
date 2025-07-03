# gdal-tutorials
Collection of GDAL tutorial scripts


## Linux Testing

```bash
docker pull ghcr.io/osgeo/gdal:alpine-small-latest
docker run -it ghcr.io/osgeo/gdal:alpine-small-latest

gdal --version
# GDAL 3.12.0dev-59a1ff7fb68d965b5d799aee9338c01728f1c4a7, released 2025/07/03
```

Note Alpine doesn't have curl.

```
apk add --no-cache curl
```

```
docker pull condaforge/mambaforge:latest
docker run -t -i condaforge/mambaforge:latest /bin/bash
conda install --yes -c conda-forge gdal
```
