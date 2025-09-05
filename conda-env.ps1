# conda env remove --name gdal --yes
conda create --yes --name gdal
conda activate gdal
conda install -c gdal-master -c conda-forge gdal-master::gdal
gdal --version
# GDAL 3.12.0dev-f01883b9c8-dirty, released 2025/07/27


conda install -c gdal-master -c conda-forge gdal-master::libgdal-arrow-parquet

