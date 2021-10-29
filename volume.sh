VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
VOLUME=${VOL::-1} 
echo $VOLUME
images_path="/home/ls/Desktop/code/linux-customizations/svgs/"
IMAGE=""

if [[  $VOLUME -lt 81 ]]; then
    IMAGE="${images_path}audio-high.svg";
    echo $IMAGE;

fi

if [[  $VOLUME -lt 61 ]]; then
    IMAGE="${images_path}audio-medium.svg";
    echo $IMAGE;

fi
echo 'before chekcing if volume'
if [[ $VOLUME -lt 44 ]]; then
    IMAGE="${images_path}audio-low.svg";
    echo $IMAGE;

fi


if [[ $VOLUME -lt 1  ]]; then
    IMAGE="${images_path}audio-muted.svg";
    echo $IMAGE;

fi

if [[ $VOLUME > 79 ]]; then
    IMAGE="${images_path}audio-superhigh.svg";
    echo $IMAGE

fi


echo $VOLUME|yad  --timeout=1 --sticky --no-buttons --image=$IMAGE --progress --percentage
