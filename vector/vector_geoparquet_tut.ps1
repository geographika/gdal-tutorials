# https://gdal.org/en/latest/tutorials/vector_geoparquet_tut.html

conda activate gdal
conda list | Select-String "libgdal-arrow-parquet"
gdal vector --formats | Select-String "Parquet"
gdal vector info https://github.com/OSGeo/gdal/raw/refs/heads/master/autotest/ogr/data/parquet/example.parquet -f json
ogrinfo https://github.com/OSGeo/gdal/raw/refs/heads/master/autotest/ogr/data/parquet/example.parquet

gdal vsi list "/vsis3/overturemaps-us-west-2/release/" --config AWS_NO_SIGN_REQUEST=YES -f json

$ENV:AWS_NO_SIGN_REQUEST="YES"
gdal vsi list "/vsis3/overturemaps-us-west-2/release/"

# cd "$ENV:CONDA_PREFIX\Lib\site-packages\osgeo_utils\samples"
# $ENV:AWS_NO_SIGN_REQUEST="YES"
# python gdal_ls.py "/vsis3/overturemaps-us-west-2/release/"



gdal vsi list "/vsis3/overturemaps-us-west-2/release/2025-09-24.0/theme=buildings/type=building"
gdal vsi list "/vsis3/overturemaps-us-west-2/release/2025-09-24.0" --recursive --depth 2
gdal vector info "/vsis3/overturemaps-us-west-2/release/2025-09-24.0/theme=buildings/type=building/part-00212-93d280c5-9152-4ecc-b500-d9681495941f-c000.zstd.parquet"
ogrinfo "/vsis3/overturemaps-us-west-2/release/2025-09-24.0/theme=buildings/type=building/part-00212-93d280c5-9152-4ecc-b500-d9681495941f-c000.zstd.parquet"

gdal vector filter `
            --input "PARQUET:/vsis3/overturemaps-us-west-2/release/2025-09-24.0/theme=buildings/type=building/" `
            --bbox 17.773,43.331,17.8392,43.3716 `
            --output buildings.parquet

ogr2ogr buildings.parquet `
            "PARQUET:/vsis3/overturemaps-us-west-2/release/2025-09-24.0/theme=buildings/type=building/" `
            -clipsrc 17.773 43.331 17.8392 43.3716

gdal vector rasterize `
            --burn 170 --burn 74 --burn 68 `
            --size 400,400 `
            --output-data-type "Byte" `
            --init 255 `
            buildings.parquet buildings.tif

gdal vector filter `
    --input "PARQUET:/vsis3/overturemaps-us-west-2/release/2025-09-24.0/theme=divisions/type=division_area/" `
    --where "country='BA' AND subtype='county'" `
    --output counties.parquet

# errors
# ERROR 1: ReadNext() failed: Couldn't deserialize thrift: No more data to read.

# and a warning second run
# Warning 1: HTTP response code on https://overturemaps-us-west-2.s3.us-east-1.amazonaws.com/release/2025-09-24.0/theme%3Ddivisions/type%3Ddivision_area/_metadata: 0

gdal vector rasterize `
    --burn 50 --burn 50 --burn 50 `
    --size 400,400 `
    --output-data-type "Byte" `
    --init 255 `
    counties.parquet counties.tif

gdal raster convert counties.tif counties.png