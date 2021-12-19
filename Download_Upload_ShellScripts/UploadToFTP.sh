#!/bin/bash

# To be used for extracting and uploading assets to cdn storage

read -p "Enter build numner " buildNumber
rm -rf $buildNumber.zip $buildNumber

curl "http://server/job/BuildGame/$buildNumber/artifact/out/*zip*/out.zip" -o $buildNumber.zip

unzip $buildNumber.zip -d tmp
rm $buildNumber.zip

mkdir $buildNumber
mv tmp/out/*.zip ./$buildNumber
unzip $buildNumber/*.zip -d ./$buildNumber

# upload a build to FTP server
read -p "Enter the path where you want to upload " pathToUpload

if [ -z "$pathToUpload" ]
then
        echo "\$pathToUpload is Empty"
        echo "Stopping the script"
else
        curl -u user_name:password -T $buildNumber/*.zip ftp://cdnstorage.productmadness.com/$pathToUpload/
        curl -u user_name:password -T $buildNumber/*/arm64-v8a/libAndroidHostExtension.so ftp://cdnstorage.productmadness.com/$pathToUpload/binaries/libAndroidHostExtension64.so
        curl -u user_name:password -T $buildNumber/*/armeabi-v7a/libAndroidHostExtension.so ftp://cdnstorage.productmadness.com/$pathToUpload/binaries/libAndroidHostExtension32.so
fi
rm -rf ./tmp
