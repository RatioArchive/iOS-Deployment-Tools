if [ $# -ne 4 ]
then
  echo "This script requires four ordered arguments to function:"
  echo 
  echo "1: Path To Build (.app bundle location)"
  echo "2: Output path for .ipa"
  echo "3: Signing certificate name"
  echo "4: Path to mobile provision to-be-imbedded"
  exit
fi
xcrun -log -verbose -sdk iphoneos PackageApplication "`pwd`/$1" -o "`pwd`/$2" --sign "$3" --embed "$4"

