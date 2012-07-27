if [ $# -ne 4 ]
then
  echo "This script requires four ordered arguments:"
  echo "1: The name of the target to build"
  echo "2: The name to use for output (will create <name>.ipa and <name>.app.dSYM.zip)"
  echo "3: Signing certificate name"
  echo "4: Path to mobile provision to-be-imbedded"
  exit
fi
agvtool new-version -all `date +%Y%m%d.%H%M%S`
xcodebuild -target "$1" SYMROOT=Sym.root
echo
echo "Packaging appliation"
echo
DATE="`date +%s`"
./package.sh "Sym.root/Release-iphoneos/$1.app" "$2.ipa" "$3" "$4"
cd "Sym.root/Release-iphoneos"
zip -r "../../$2.app.dSYM.zip" "$1.app.dSYM"
cd "../.."
rm -r Sym.root

