Can't use ; as with postgres driver
Require multiple PRELUDE_STATEMENTS
only one per line




https://duckdb.org/docs/stable/extensions/installing_extensions.html

## Windows

Downloads: https://github.com/duckdb/duckdb/releases/


https://github.com/duckdb/duckdb/releases/download/v1.4.0/libduckdb-windows-arm64.zip



https://github.com/duckdb/duckdb/releases/download/v1.3.2/libduckdb-windows-amd64.zip

We want the duckdb.dll not the client (duckdb_cli-windows-amd64 which contains duckdb.exe)

If not added the DLL folder the environment:
 ( or maybe due to older version or non-matching version?)

    ERROR 1: Can't load requested DLL: duckdb.dll
    126: The specified module could not be found.



gdal vector info tileindex.gti.fgb| python D:\GitHub\mappyfile-templates\scripts\gdal_map.py tileindex.map
map2img -m tileindex.map -o tileindex.png -all_debug 5

## MapServer

```
# conda install mappyfile

conda install --yes -c conda-forge mapserver
pip install -e D:\GitHub\mappyfile
pip install -e D:\GitHub\mappyfile-templates
cd D:\GitHub\gdal-tutorials\duckdb\tmp
gdal vector info POI_FR_H3.parquet  --output-format json | python D:\GitHub\mappyfile-templates\scripts\gdal_map.py POI_FR_H3.map
map2img -m POI_FR_H3.map -o POI_FR_H3.png -all_debug 1

ogrinfo POI_FR_H3.parquet -sql "SELECT MIN(POI_count), MAX(POI_count) FROM POI_FR_H3"
gdal vector info POI_FR_H3.parquet --sql "SELECT MIN(POI_count), MAX(POI_count) FROM POI_FR_H3"

# OGRFeature(SELECT):0
#  MIN_POI_count (Integer64) = 1
#  MAX_POI_count (Integer64) = 46208
```

map2img -m D:\Temp\test2.map  -o D:\Temp\rail.png -conf C:\MapServer\apps\mapserver-debug.conf

map2img -m D:\GitHub\gdal-tutorials\duckdb\tmp\POI_FR_H3.map  -o D:\Temp\POI_FR_H3.png -conf C:\MapServer\apps\mapserver-debug.conf


ogr2ogr POI_FR_H3.fgb POI_FR_H3.parquet




Other errors:


ERROR 1: Can't load requested DLL: C:\Users\seth_\.conda\envs\gdal\Library\lib\gdalplugins\ogr_Parquet.dll
127: The specified procedure could not be found.

ERROR 1: Can't load requested DLL: C:\Users\seth_\.conda\envs\gdal\Library\lib\gdalplugins\ogr_Parquet.dll
127: The specified procedure could not be found.

ERROR 1: parquet driver has no vector capabilities.

Files exist. Mismatch between DLLs?

#     -oo ADBC_DRIVER="D:\Tools\duckdb\duckdb.dll" `
#     -oo ADBC_DRIVER="D:\Tools\libduckdb-windows-amd64\duckdb.dll" `

ogr2ogr -f parquet POI_FR_H3.parquet -nlt POINT -a_srs epsg:4326 `
    -oo ADBC_DRIVER="D:\Tools\libduckdb-windows-amd64\duckdb.dll" `
    -oo PRELUDE_STATEMENTS="INSTALL SPATIAL" `
    -oo PRELUDE_STATEMENTS="LOAD SPATIAL" `
    -oo PRELUDE_STATEMENTS="load parquet" `
    -oo PRELUDE_STATEMENTS="INSTALL httpfs" `
    -oo PRELUDE_STATEMENTS="load httpfs" `
    -oo PRELUDE_STATEMENTS="install aws" `
    -oo PRELUDE_STATEMENTS="load aws" `
    -oo PRELUDE_STATEMENTS="install h3 from community" `
    -oo PRELUDE_STATEMENTS="load h3" `
    -oo SQL="select h3_id, ST_GeomFromText(h3_cell_to_boundary_wkt(h3_id)) geometry, count(*) POI_count from (select id, h3_latlng_to_cell_string(st_y(geometry), st_x(geometry), 6) as h3_id from read_parquet('s3://overturemaps-us-west-2/release/2025-06-25.0/theme=places/type=place/*') where addresses[1].country='FR' and bbox.xmin between -5 and 9 and bbox.ymin between 41 and 51) group by h3_id" `
    ADBC:


# make sure extensions are installed, or you will get the following errors:
# this only has to be done once:

ERROR 1: AdbcStatementExecuteQuery() failed: IO Error: Extension "C:\Users\seth_\.duckdb\extensions\v1.4.0\windows_amd64\spatial.duckdb_extension" not found.
Extension "SPATIAL" is an existing extension.

Install it first using "INSTALL SPATIAL".
ERROR 1: AdbcStatementExecuteQuery() failed: IO Error: Extension "C:\Users\seth_\.duckdb\extensions\v1.4.0\windows_amd64\httpfs.duckdb_extension" not found.
Extension "httpfs" is an existing extension.

Install it first using "INSTALL httpfs".

# update everything in the environment

conda update -c gdal-master -c conda-forge --all

