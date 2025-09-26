r"""
conda install pillow --yes

cd D:\GitHub\gdal-tutorials\hillshade\tmp

python ../../scripts/optimise_image.py color-hillshade.png
python ../../scripts/optimise_image.py color-hillshade.png
python ../../scripts/optimise_image.py color.tif

cd D:\GitHub\gdal-tutorials\scripts
python optimise_image.py D:\GitHub\gdal-tutorials\duckdb\hexbin.png

"""
import sys
from PIL import Image
import os

def main(input_file, scale_ratio=0.2):

    # Open the image
    image = Image.open(input_file)

    new_size = (int(image.width * scale_ratio), int(image.height * scale_ratio))
    resized_image = image.resize(new_size, Image.LANCZOS)

    # create output filename
    base, _ = os.path.splitext(input_file)
    output_file = f"{base}-resized.png"

    # Save as optimized PNG
    resized_image.save(output_file, format="PNG", optimize=True)

    print(f"Resized image saved as: {output_file}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python optimise_image.py <image.png>")
        sys.exit(1)

    main(sys.argv[1])
