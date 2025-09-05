# Hillshade Tutorial Notes

## Data Notes

RGEALTI

RGE = Référentiel à Grande Échelle
ALTI = Altitude

Download from https://geoservices.ign.fr/rgealti
Département 90 - Territoire de Belfort

https://data.geopf.fr/telechargement/download/RGEALTI/RGEALTI_2-0_5M_ASC_LAMB93-IGN69_D090_2021-01-13/RGEALTI_2-0_5M_ASC_LAMB93-IGN69_D090_2021-01-13.7z (45 MB)


WFS Service platform
https://geoservices.ign.fr/documentation/services/services-geoplateforme/diffusion#70070

## Generating Documentation Images

Vector:

```bash

gdal vector info tileindex.gti.fgb| python D:\GitHub\mappyfile-templates\scripts\gdal_map.py tileindex.map
map2img -m tileindex.map -o tileindex.png -all_debug 5
python ../../scripts/optimise_image.py aspect.png

cd D:\GitHub\gdal-tutorials\hillshade
map2img -m dtm.map -o clip.png -all_debug 5

python ../scripts/optimise_image.py clip.png

```

Raster:

```bash
gdal raster info aspect.tif | python D:\GitHub\mappyfile-templates\scripts\gdal_map.py aspect.map
map2img -m aspect.map -o aspect.png -all_debug 5
python ../../scripts/optimise_image.py aspect.png

gdal raster info slope.tif | python D:\GitHub\mappyfile-templates\scripts\gdal_map.py slope.map
map2img -m slope.map -o slope.png -all_debug 5
python ../../scripts/optimise_image.py slope.png

gdal raster info color.tif | python D:\GitHub\mappyfile-templates\scripts\gdal_map.py color.map
map2img -m color.map -o color.png -all_debug 5
python ../../scripts/optimise_image.py color.png

gdal raster info color.tif | python D:\GitHub\mappyfile-templates\scripts\gdal_map.py color.map
map2img -m color.map -o color.png -all_debug 5
python ../../scripts/optimise_image.py color.png
```

## Email

Need to force type for WFS     -nlt POLYGON `


CHECK: option or we get the following error (due to the different projections)
