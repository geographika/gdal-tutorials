Can't use ; as with postgres driver
Require multiple PRELUDE_STATEMENTS
only one per line




https://duckdb.org/docs/stable/extensions/installing_extensions.html

## Windows

https://github.com/duckdb/duckdb/releases/download/v1.3.2/libduckdb-windows-amd64.zip

We want the duckdb.dll not the client (duckdb_cli-windows-amd64 which contains duckdb.exe)


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