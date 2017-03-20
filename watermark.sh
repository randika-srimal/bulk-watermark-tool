for i in ./*.jpg ./*.jpeg
do
    if [ ! -d "./watermarked" ]; then mkdir "./watermarked"; fi
    filename=$(basename "$i")
    ww=`convert $filename -format "%[fx:.10*w]" info:`
	hh=`convert $filename -format "%[fx:.10*h]" info:`	
    convert \
    -filter Lanczos \
    "$i" \
    -set option:filter:filter Lanczos \
    -set option:filter:blur 0.8 \
    \( ./watermark.png -resize ${ww}x${hh} \) -gravity SouthEast -geometry +0 -composite \
    "./watermarked/$filename"
done