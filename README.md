# gdal-tutorials

Collection of GDAL tutorial scripts

## Linux Testing

```bash
docker pull ghcr.io/osgeo/gdal:alpine-small-latest
docker run -it ghcr.io/osgeo/gdal:alpine-small-latest

gdal --version
# GDAL 3.12.0dev-c93ac7701e7c5b3b5537598f2dea1e8a382cc81a, released 2025/08/08
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
