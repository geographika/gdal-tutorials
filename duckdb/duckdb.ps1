conda activate gdal

# ON WINDOWS NEED TO ADD:
# or get # ERROR 1: Unable to find driver `parquet'

# need to install from master to avoid downgrading GDAL
conda install -c gdal-master -c conda-forge gdal-master::libgdal-arrow-parquet

# following does not seem to work
#  $env:Path = "D:\Tools\libduckdb-windows-amd64;" + $env:Path


# test

ogrinfo -oo ADBC_DRIVER="D:\Tools\libduckdb-windows-amd64\duckdb.dll" D:\Data\GDAL\test.db


# need to add this
$env:Path = "D:\Tools\libduckdb-windows-amd64;" + $env:Path

ogr2ogr -f parquet overture-vt-addresses.parquet `
    -oo ADBC_DRIVER="D:\Tools\libduckdb-windows-amd64\duckdb.dll" `
    -oo PRELUDE_STATEMENTS="INSTALL SPATIAL" `
    -oo PRELUDE_STATEMENTS="LOAD SPATIAL" `
    -oo PRELUDE_STATEMENTS="INSTALL PARQUET" `
    -oo PRELUDE_STATEMENTS="LOAD PARQUET" `
    -oo PRELUDE_STATEMENTS="load httpfs" `
    -oo PRELUDE_STATEMENTS="INSTALL aws" `
    -oo PRELUDE_STATEMENTS="load aws" `
    -oo SQL="select * from read_parquet('s3://overturemaps-us-west-2/release/2025-05-21.0/theme=addresses/type=address/*') where country='US' and bbox.xmin between -74 and -73 and bbox.ymin between 42.7 and 45.1 and address_levels[1].value='VT'"  ADBC:

# ERROR 1: Unable to open datasource `ADBC:' with the following drivers.

gdal vector --formats
# ADBC -vector- (ro): Arrow Database Connectivity


python -c "import ctypes;ctypes.CDLL(r'D:\Tools\libduckdb-windows-amd64\duckdb.dll')"


# the following both return an error
ogrinfo D:\Data\GDAL\test.db
ogrinfo -oo ADBC_DRIVER="D:\Tools\libduckdb-windows-amd64\duckdb.dll" D:\Data\GDAL\test.db

# ERROR 1: Can't load requested DLL: duckdb.dll
# 126: The specified module could not be found.
# ogrinfo failed - unable to open 'D:\Data\GDAL\test.db'

# need to add this

$env:Path = "D:\Tools\libduckdb-windows-amd64;" + $env:Path

# ERROR 1: AdbcDatabaseInit() failed: IO Error: Cannot open file "D:\Data\GDAL\test.db": The process cannot access the file because it is being used by another process.

# File is already open in
# C:\Users\seth_\.conda\envs\gdal\Library\bin\ogrinfo.exe (PID 58488)
# ogrinfo failed - unable to open 'D:\Data\GDAL\test.db'.

# restart environment does not help

# hexagons

ogr2ogr -f parquet POI_FR_H3.parquet -nlt POINT -a_srs epsg:4326 `
    -oo ADBC_DRIVER="D:\Tools\libduckdb-windows-amd64\duckdb.dll" `
    -oo PRELUDE_STATEMENTS="LOAD SPATIAL" `
    -oo PRELUDE_STATEMENTS="load parquet" `
    -oo PRELUDE_STATEMENTS="load httpfs" `
    -oo PRELUDE_STATEMENTS="install aws" `
    -oo PRELUDE_STATEMENTS="load aws" `
    -oo PRELUDE_STATEMENTS="install h3 from community" `
    -oo PRELUDE_STATEMENTS="load h3" `
    -oo SQL="select h3_id, ST_GeomFromText(h3_cell_to_boundary_wkt(h3_id)) geometry, count(*) POI_count from (select id, h3_latlng_to_cell_string(st_y(geometry), st_x(geometry), 6) as h3_id from read_parquet('s3://overturemaps-us-west-2/release/2025-06-25.0/theme=places/type=place/*') where addresses[1].country='FR' and bbox.xmin between -5 and 9 and bbox.ymin between 41 and 51) group by h3_id" `
    ADBC:

# MapServer

conda install --yes -c conda-forge mapserver

