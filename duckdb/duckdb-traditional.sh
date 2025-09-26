conda create --yes --name gdal
conda activate gdal

#conda install --yes -c conda-forge gdal libgdal-arrow-parquet
# gdal --version
# GDAL 3.11.4 "Eganville", released 2025/09/04
# conda list | grep "libgdal-arrow-parquet"
# libgdal-arrow-parquet      3.10.0           h706f8e0_4            conda-forge

conda install -c gdal-master -c conda-forge gdal-master::libgdal-arrow-parquet --yes
gdal --version
# GDAL 3.12.0dev-c8056f4be7-dirty, released 2025/09/26
conda list | grep "libgdal-arrow-parquet"
# libgdal-arrow-parquet               3.11.99          he2d30bd_2112     gdal-master

conda install libduckdb libgdal-adbc --yes

# python -c "import duckdb; print(duckdb.__version__)"
# fails



export AWS_NO_SIGN_REQUEST="YES"
gdal vsi list "/vsis3/overturemaps-us-west-2/release/2025-09-24.0/theme=addresses/type=address/"

echo $GDAL_DRIVER_PATH
# /opt/conda/envs/gdal/lib/gdalplugins

# find / -name *duckdb*
# /opt/conda/pkgs/libduckdb-1.3.2-h8eb67b4_2/lib/libduckdb.so

# export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=/opt/conda/pkgs/libduckdb-1.3.2-h8eb67b4_2/lib:$LD_LIBRARY_PATH

conda list | grep "duckdb"
# libduckdb                           1.3.2            h8eb67b4_2        conda-forge


gdal vector --formats | grep ADBC
# ERROR 1: libgdal.so.36: cannot open shared object file: No such file or directory

ogr2ogr -f parquet overture-vt-addresses.parquet \
    -oo ADBC_DRIVER=libduckdb \
    -oo PRELUDE_STATEMENTS="INSTALL spatial" \
    -oo PRELUDE_STATEMENTS="LOAD spatial" \
    -oo PRELUDE_STATEMENTS="INSTALL parquet" \
    -oo PRELUDE_STATEMENTS="LOAD parquet" \
    -oo PRELUDE_STATEMENTS="INSTALL httpfs" \
    -oo PRELUDE_STATEMENTS="LOAD httpfs" \
    -oo PRELUDE_STATEMENTS="INSTALL aws" \
    -oo PRELUDE_STATEMENTS="LOAD aws" \
    -oo SQL="select * from read_parquet('s3://overturemaps-us-west-2/release/2025-09-24.0/theme=addresses/type=address/*') where country='US' and bbox.xmin between -74 and -73 and bbox.ymin between 42.7 and 45.1 and address_levels[1].value='VT'" \
    ADBC:

# Extension "httpfs" is an existing extension.

# Install it first using "INSTALL httpfs".
# ERROR 1: AdbcStatementSetSqlQuery() failed: Missing Extension Error: File s3://overturemaps-us-west-2/release/2025-09-24.0/theme=addresses/type=address/* requires the extension httpfs to be loaded

# Please try installing and loading the httpfs extension by running:
# INSTALL httpfs;
# LOAD httpfs;

ogr2ogr -f CSV /vsistdout/ overture-vt-addresses.parquet -limit 5 -select id,number,street,postcode,country


gdal vector pipeline \
    ! read overture-vt-addresses.parquet \
    ! sql --sql "SELECT * FROM 'overture-vt-addresses' LIMIT 5" --dialect SQLITE \
    ! select --fields number,street,postcode,country \
    ! write /vsistdout/ --output-format CSV

# option --quiet is unknown - works on Windows as newer: GDAL 3.12.0dev-2b1c4d1fdb-dirty, released 2025/09/22
# GDAL 3.11.4 "Eganville", released 2025/09/04


# Hexagons example

ogr2ogr -f parquet POI_FR_H3.parquet -nlt POINT -a_srs epsg:4326 \
    -oo ADBC_DRIVER=libduckdb \
    -oo PRELUDE_STATEMENTS="LOAD spatial" \
    -oo PRELUDE_STATEMENTS="LOAD parquet" \
    -oo PRELUDE_STATEMENTS="LOAD httpfs" \
    -oo PRELUDE_STATEMENTS="LOAD aws" \
    -oo PRELUDE_STATEMENTS="INSTALL h3 FROM community" \
    -oo PRELUDE_STATEMENTS="LOAD h3" \
    -oo SQL="select h3_id, ST_GeomFromText(h3_cell_to_boundary_wkt(h3_id)) geometry, count(*) POI_count from (select id, h3_latlng_to_cell_string(st_y(geometry), st_x(geometry), 6) as h3_id from read_parquet('s3://overturemaps-us-west-2/release/2025-09-24.0/theme=places/type=place/*') where addresses[1].country='FR' and bbox.xmin between -5 and 9 and bbox.ymin between 41 and 51) group by h3_id" \
    ADBC:
