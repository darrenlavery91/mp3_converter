#!/bin/bash
#notes on mac install:
#xcode-select --install
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#brew -v
#brew update
#brew upgrade
#brew install ffmpeg
##mac requires brew latest, install ffmpeg.
input="/mnt/in/"
output="/mnt/out/"
processed="/mnt/processed/"
timelog="/mnt/timelog.txt"
cd "$input"
echo "##### Reaching into space...and removing spaces #########"
# removed all spaces and replaces with underscore

for oldname in *
do
	newname=`echo $oldname | sed -e 's/ /_/g'`
	if [ "$newname" = "$oldname" ]
	then
		continue
	fi
	if [ -e "$newname" ]
	then
		echo Skipping "$oldname", because "$newname" exists
	else
		mv "$oldname" "$newname"
	fi
done
sleep 4

#echo "##### removing special characters #########"
#for file in *; do mv "$file" $(echo "$file" | sed -e 's/[^A-Za-z0-9._-]/_/g'); done &

#sleep 4
echo "##### Getting out of space...removed all #########"
sleep 5
mp3dir() {
file=$(find "$input" -maxdepth 1 -type f \( -iname "*.mxf" -o -iname "*.mov" -o -iname "*.mpg" -o -iname ".flac" -o -iname ".wav" -o -iname ".AIFF" -o -iname "*.mpeg"\) | wc -l)
if [ "$file" -ne 1 ]; then
	for f in *
	do
	filenameinput=$(find "$1" -maxdepth 1 -mindepth 1 -type f | sort | xargs -n 1 basename | head -n 1)
	filenameoutput=$(find "$1" -maxdepth 1 -mindepth 1 -type f | sort | head -n 1 | rev | cut -c5- | rev)
  fileinput=$(find $1 -maxdepth 1 -mindepth 1 -type f | sort | head -n 1)
echo "##### CONVERTING FILES to MP3 #########"
	#echo "Start TIME: $( TZ='Africa/Johannesburg' date )" &>> "$timelog"

	ffmpeg -i "$filenameinput" -vn -acodec mp3 "$filenameoutput"mp3
	#echo "End TIME: $( TZ='Africa/Johannesburg' date )" &>> "$timelog"
	mv *.mp3 "$output"
	mv -vf $fileinput $processed
  done
fi
}
mp3dir $input $processed
echo "mp3 conversion is finished"
