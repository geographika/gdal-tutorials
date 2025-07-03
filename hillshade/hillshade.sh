# apk add --no-cache p7zip # Alpine

apt-get update && apt-get install curl p7zip-full -y

curl -O https://data.geopf.fr/telechargement/download/RGEALTI/RGEALTI_2-0_5M_ASC_LAMB93-IGN69_D090_2021-01-13/RGEALTI_2-0_5M_ASC_LAMB93-IGN69_D090_2021-01-13.7z
7z x RGEALTI_2-0_5M_ASC_LAMB93-IGN69_D090_2021-01-13.7z

# create a GTI from all the asc files
files="RGEALTI_2-0_5M_ASC_LAMB93-IGN69_D090_2021-01-13/RGEALTI/1_DONNEES_LIVRAISON_2021-10-00009/RGEALTI_MNT_5M_ASC_LAMB93_IGN69_D090/*.asc"
gdal driver gti create --layer dem --dst-crs EPSG:2154 --output-format FlatGeobuf $files tileindex.gti.fgb

gdal vector pipeline \
    ! read WFS:"https://data.geopf.fr/wfs/ows?version=2.0.0&typename=ADMINEXPRESS-COG.2017:commune" \
    ! filter --where "insee_com='90065'" \
    ! write --output-layer=commune commune.fgb

gdal raster clip --like commune.fgb  tileindex.gti.fgb clipped.tif --overwrite --allow-bbox-outside-source

# ERROR 6: GEOS support not enabled.
# ERROR 1: clip: Geometry of feature 0 of commune.fgb is invalid. You may be able to correct it with 'gdal vector geom make-valid'.

# gdal-config --dep-libs
# should mention -lgeos_c

gdal raster scale clipped.tif out_8bit_gray.tif --output-data-type Byte --creation-option COMPRESS=LZW
gdal raster hillshade --zfactor=5 clipped.tif hillshade.tif --overwrite --progress
gdal raster slope clipped.tif slope.tif --overwrite --progress
gdal raster aspect clipped.tif aspect.tif --overwrite
gdal raster color-map --color-map=color-map-percentage.txt clipped.tif color.tif --overwrite

gdal raster info --min-max clipped.tif

# get some stats at the end?

# https://gdal.org/en/latest/programs/gdal_raster_color_merge.html
# Added in version 3.12
# conda install --yes -c conda-forge gdal --update-all
# gdal raster color-merge allows the user to colorize a grayscale image with a RGB one.
# gdal raster color-merge --grayscale=hillshade.tif color.tif hypsometric_combined_with_hillshade.jpg
