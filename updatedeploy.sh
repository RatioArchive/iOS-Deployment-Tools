#Pull, then update if there are changes
#This script is designed to run hourly and will push all git commit messages in the last hour to TestFlight as the build description
UPTODATE=`git pull | grep "Already up-to-date."`
echo "$UPTODATE"
if [ -z "$UPTODATE" ]; then
  LASTDATE="`date -v -1H`"
  echo "Last date: $LASTDATE"
  GITLOG="`git log --since="$LASTDATE"`"
  echo "Git log: $GITLOG"
  ./deploy.sh "$GITLOG"
fi
