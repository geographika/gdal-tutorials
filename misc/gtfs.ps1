conda activate gdal

cd "D:\Data\NTA"

gdal vector info GTFS_Realtime.zip

"""
ERROR 1: cpl_unzOpenCurrentFile() failed
ERROR 4: `/vsizip/{GTFS_Realtime.zip}/shapes.txt' not recognized as being in a supported file format.
ERROR 1: cpl_unzOpenCurrentFile() failed
ERROR 4: `/vsizip/{GTFS_Realtime.zip}/stop_times.txt' not recognized as being in a supported file format.
ERROR 1: cpl_unzOpenCurrentFile() failed
ERROR 4: `/vsizip/{GTFS_Realtime.zip}/shapes.txt' not recognized as being in a supported file format.
ERROR 1: cpl_unzOpenCurrentFile() failed
"""

ogrinfo GTFS_Realtime.zip

ogrinfo GTFS:GTFS_Realtime.zip

ogrinfo GTFS_Realtime.zip -if GTFS

 https://www.transportforireland.ie/transitData/Data/GTFS_Realtime.zip

ogrinfo /vsicurl/https://www.transportforireland.ie/transitData/Data/GTFS_Realtime.zip

# no errors


ogr2ogr -f "FlatGeobuf" stops.fgb GTFS_Realtime.zip trips


ERROR 1: ICreateFeature: NULL geometry not supported with spatial index
ERROR 1: ICreateFeature: NULL geometry not supported with spatial index
ERROR 1: ICreateFeature: NULL geometry not supported with spatial index

ogr2ogr -f "FlatGeobuf" stops.fgb GTFS_Realtime.zip stops

ogr2ogr -f "FlatGeobuf" trips.fgb /vsicurl/https://www.transportforireland.ie/transitData/Data/GTFS_Realtime.zip trips


ogr2ogr -f "FlatGeobuf" stops.fgb /vsicurl/https://www.transportforireland.ie/transitData/Data/GTFS_Realtime.zip stops


https://api.nationaltransport.ie/gtfsr/v2/gtfsr


gdal vector info /vsicurl/https://www.transportforireland.ie/transitData/Data/GTFS_Realtime.zip

ERROR 1: cpl_unzOpenCurrentFile() failed
ERROR 4: `/vsizip/{/vsicurl/https://www.transportforireland.ie/transitData/Data/GTFS_Realtime.zip}/shapes.txt' not recognized as being in a supported file format.
ERROR 1: cpl_unzOpenCurrentFile() failed
ERROR 4: `/vsizip/{/vsicurl/https://www.transportforireland.ie/transitData/Data/GTFS_Realtime.zip}/shapes.txt' not recognized as being in a supported file format.
ERROR 1: In file D:\bld\libgdal-core_1751393617652\work\port\cpl_vsil_gzip.cpp, at line 1211, decompression failed with z_err = -3, return = 33
ERROR 1: In file D:\bld\libgdal-core_1751393617652\work\port\cpl_vsil_gzip.cpp, at line 1211, decompression failed with z_err = -3, return = 33




ERROR 1: cpl_unzOpenCurrentFile() failed
ERROR 4: `/vsizip/{/vsicurl/https://www.transportforireland.ie/transitData/Data/GTFS_Realtime.zip}/stop_times.txt' not recognized as being in a supported file format.
ERROR 1: cpl_unzOpenCurrentFile() failed
Warning 1: Value '5809.749.51128' of field shapes.shape_pt_lon parsed incompletely to real 5809.749.
Warning 1: Value '21038732.9769959609809.57' of field shapes.shape_dist_traveled parsed incompletely to real 21038732.97699596.
Warning 1: Value '.97652.3711555' of field shapes.shape_pt_lon parsed incompletely to real 0.9765200000000001.
Warning 1: Value '5286952.298489252.860190257' of field shapes.shape_dist_traveled parsed incompletely to real 5286952.298489252.
Warning 1: Value '-452.498.680985' of field shapes.shape_pt_lat parsed incompletely to real -452.498.
Warning 1: Value '125804.9-25171' of field shapes.shape_pt_lon parsed incompletely to real 125804.9.
Warning 1: Value '125804._10415' of field shapes.shape_pt_lat parsed incompletely to real 125804.
Warning 1: Value '.97652.371' of field shapes.shape_pt_lon parsed incompletely to real 0.9765200000000001.
Warning 1: Value '8.67184821852_109' of field shapes.shape_pt_lon parsed incompletely to real 8.671848218519999.
Warning 1: Value '210599594.214.191488452_11473' of field shapes.shape_pt_lat parsed incompletely to real 210599594.214.
Warning 1: Value '52.788452_11233' of field shapes.shape_dist_traveled parsed incompletely to real 52.788452.
Warning 1: Value '-8.17576252_1405.012.90096' of field shapes.shape_dist_traveled parsed incompletely to real -8.175762519999999.
Warning 1: Value '-77137.8342803.862' of field shapes.shape_pt_lon parsed incompletely to real -77137.8342803.
Warning 1: Value '-8.6252.63252.883' of field shapes.shape_dist_traveled parsed incompletely to real -8.6252.
Warning 1: Value '53.0035447403.082' of field shapes.shape_pt_lat parsed incompletely to real 53.0035447403.
Warning 1: Value '52.8.51' of field shapes.shape_pt_lat parsed incompletely to real 52.8.
Warning 1: Value '552_109' of field shapes.shape_pt_lat parsed incompletely to real 552.
Warning 1: Value '52.27780.9' of field shapes.shape_pt_lon parsed incompletely to real 52.2778.
Warning 1: Value '52.2060752.48.90967104839053' of field shapes.shape_pt_lat parsed incompletely to real 52.2060752.
Warning 1: Value '53.060752.48.909671042392' of field shapes.shape_pt_lat parsed incompletely to real 53.060752.
Warning 1: Value '2_10_10909' of field shapes.shape_pt_lat parsed incompletely to real 2.
Warning 1: Value '52.8.817' of field shapes.shape_pt_lat parsed incompletely to real 52.8.
Warning 1: Value '2_10' of field shapes.shape_pt_lon parsed incompletely to real 2.
Warning 1: Value '-2_1481694752.5' of field shapes.shape_dist_traveled parsed incompletely to real -2.
Warning 1: Value '2.8.52.86817' of field shapes.shape_pt_lat parsed incompletely to real 2.8.
Warning 1: Value '24.303_10' of field shapes.shape_pt_lon parsed incompletely to real 24.303.
Warning 1: Value '-2_14816' of field shapes.shape_dist_traveled parsed incompletely to real -2.
Warning 1: Value '-7._10944524817' of field shapes.shape_pt_lat parsed incompletely to real -7.
Warning 1: Value '22_108' of field shapes.shape_pt_lat parsed incompletely to real 22.
Warning 1: Value '52.876735978.55050785' of field shapes.shape_pt_lon parsed incompletely to real 52.876735978.
Warning 1: Value '95.3_108' of field shapes.shape_pt_lon parsed incompletely to real 95.3.
Warning 1: Value '7978.68180689.72014' of field shapes.shape_pt_lon parsed incompletely to real 7978.68180689.
Warning 1: Value '52.8558.21' of field shapes.shape_pt_lat parsed incompletely to real 52.8558.
Warning 1: Value '012928.68180689.720148' of field shapes.shape_pt_lat parsed incompletely to real 12928.68180689.
Warning 1: Value '.9104486552_109' of field shapes.shape_dist_traveled parsed incompletely to real 0.9104486552.
Warning 1: Value '208712833214.0-7._10944524817' of field shapes.shape_dist_traveled parsed incompletely to real 208712833214.
Warning 1: Value '52.28.835375' of field shapes.shape_pt_lon parsed incompletely to real 52.28.
Warning 1: Value '52.2_10924' of field shapes.shape_dist_traveled parsed incompletely to real 52.2.
Warning 1: Value '2192.793.082' of field shapes.shape_pt_lon parsed incompletely to real 2192.793.
Warning 1: Value '-7-8.' of field shapes.shape_pt_lat parsed incompletely to real -7.
Warning 1: Value '-7.7.193' of field shapes.shape_pt_lon parsed incompletely to real -7.7.
Warning 1: Value '-7.6857.199' of field shapes.shape_pt_lat parsed incompletely to real -7.6857.
Warning 1: Value '82-80985' of field shapes.shape_pt_lon parsed incompletely to real 82.
Warning 1: Value '-777508529452_99' of field shapes.shape_pt_lat parsed incompletely to real -777508529452.
Warning 1: Value '212836.35167352_109' of field shapes.shape_pt_lon parsed incompletely to real 212836.35167352.
Warning 1: Value '--7.328.7667' of field shapes.shape_dist_traveled parsed incompletely to real 0.
Warning 1: Value '1182_10972_109-.129542.28521176776993062862.788452_11233' of field shapes.shape_pt_lon parsed incompletely to real 1182.
Warning 1: Value '8115426052.56.195' of field shapes.shape_pt_lon parsed incompletely to real 8115426052.56.
Warning 1: Value '182-452.6' of field shapes.shape_pt_lat parsed incompletely to real 182.
Warning 1: Value '8115426052.56.19827.1' of field shapes.shape_pt_lon parsed incompletely to real 8115426052.56.
Warning 1: Value '52_11236109' of field shapes.shape_pt_lat parsed incompletely to real 52.
Warning 1: Value '-7.21684533610916.622.5612996' of field shapes.shape_pt_lat parsed incompletely to real -7.21684533610916.
Warning 1: Value '-819-8.8.' of field shapes.shape_pt_lon parsed incompletely to real -819.
Warning 1: Value '2_109' of field shapes.shape_pt_lat parsed incompletely to real 2.
Warning 1: Value '57754452_147' of field shapes.shape_pt_lon parsed incompletely to real 57754452.
Warning 1: Value '218147.71052.200503876759068857.8227021' of field shapes.shape_pt_lat parsed incompletely to real 218147.71052.
Warning 1: Value '528365.163583.08383' of field shapes.shape_pt_lon parsed incompletely to real 528365.163583.
Warning 1: Value '567.05.910214.0116645.' of field shapes.shape_pt_lat parsed incompletely to real 567.05.
Warning 1: Value '82-80985' of field shapes.shape_pt_lat parsed incompletely to real 82.
Warning 1: Value '83442.82-8033' of field shapes.shape_pt_lat parsed incompletely to real 83442.82000000001.
Warning 1: Value '-89664.011669-80552_1017677634876' of field shapes.shape_dist_traveled parsed incompletely to real -89664.011669.
Warning 1: Value '.976.9' of field shapes.shape_dist_traveled parsed incompletely to real 0.976.
Warning 1: Value '947-8033' of field shapes.shape_pt_lon parsed incompletely to real 947.
Warning 1: Value '.452.6' of field shapes.shape_pt_lat parsed incompletely to real 0.452.
Warning 1: Value '5232_1096146' of field shapes.shape_pt_lat parsed incompletely to real 5232.
Warning 1: Value '553.2064.19' of field shapes.shape_pt_lat parsed incompletely to real 553.2064.
Warning 1: Value '46919135.91397.0151_109' of field shapes.shape_pt_lat parsed incompletely to real 46919135.91397.
Warning 1: Value '731952.9011.' of field shapes.shape_pt_lon parsed incompletely to real 731952.9011.
Warning 1: Value '52967362_19109' of field shapes.shape_pt_lon parsed incompletely to real 52967362.
Warning 1: Value '-7.2.494' of field shapes.shape_pt_lon parsed incompletely to real -7.2.
Warning 1: Value '53.036452_1856465433' of field shapes.shape_dist_traveled parsed incompletely to real 53.036452.
Warning 1: Value '1569.918011.' of field shapes.shape_pt_lat parsed incompletely to real 1569.918011.
Warning 1: Value '142..082' of field shapes.shape_pt_lon parsed incompletely to real 142.
Warning 1: Value '-7.8298.213777452_094797452_6847' of field shapes.shape_pt_lat parsed incompletely to real -7.8298.
Warning 1: Value '.452.6' of field shapes.shape_pt_lon parsed incompletely to real 0.452.
Warning 1: Value '52.25777.659.39253152_0834' of field shapes.shape_pt_lat parsed incompletely to real 52.25777.
Warning 1: Value '52.-8.823.7058.72.56249284.65234604' of field shapes.shape_dist_traveled parsed incompletely to real 52.
Warning 1: Value '12982-845252_1686' of field shapes.shape_pt_lat parsed incompletely to real 12982.
Warning 1: Value '1298291.2_1253024' of field shapes.shape_pt_lon parsed incompletely to real 1298291.2.
Warning 1: Value '-8.668119234.548253024' of field shapes.shape_dist_traveled parsed incompletely to real -8.668119234000001.
Warning 1: Value '733-7.78659.39K]yÕyÕyÕyÕy121æ.-dÙè?┐6494444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444eîåÁ÷Á÷Á÷Á÷Á÷Á4'W.851' of field shapes.shape_pt_lat parsed incompletely to real 733.
ERROR 1: In file D:\bld\libgdal-core_1751393617652\work\port\cpl_vsil_gzip.cpp, at line 1211, decompression failed with z_err = -3, return = 8
ERROR 1: In file D:\bld\libgdal-core_1751393617652\work\port\cpl_vsil_gzip.cpp, at line 1211, decompression failed with z_err = -3, return = 8
ERROR 1: In file D:\bld\libgdal-core_1751393617652\work\port\cpl_vsil_gzip.cpp, at line 1211, decompression failed with z_err = -3, return = 8


D:\Data\NTA\GTFS_Realtime.zip
Headers Error : shapes.txt
Headers Error : stop_times.txt



