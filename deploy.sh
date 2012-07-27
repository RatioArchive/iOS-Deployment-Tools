#Project specific settings, update these when copying the build scripts
TARGET= #XCode target to build
OUTPUT=out
CERTIFICATE="" #Plain text name of distribution certificate as found in Keychain Access
PROVISION="" #Path to provisioning profile (e.g.: myprovision.mobileprovision)
APIKEY= #TestFlight API key
TEAMKEY= #TestFlight team key
DISTRIBUTION="" #TestFlight distribution list for auto-sharing
NOTIFY=True #should the distribution list be notified by email

./build.sh "$TARGET" "$OUTPUT" "$CERTIFICATE" "$PROVISION"
./testflight.sh "$OUTPUT.ipa" "$OUTPUT.app.dSYM.zip" $APIKEY $TEAMKEY "$1" $NOTIFY "$DISTRIBUTION"
rm "$OUTPUT.ipa" "$OUTPUT.app.dSYM.zip"

