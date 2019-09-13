#!/bin/sh

# This script checks for the presence of files in ~/Library/Mobile Documents - the location of iCloud documents
# It is meant to be a Jamf Extension Attribute, and it works as intended as a script, though it breaks at "&&" as an EA

# Mobile Documents is present by default in some versions of macOS, 
# and can get deleted as iCloud Drive is toggled on & off, 
# so we need to check for its presence first, 
# then determine whether it contains files

# first, get the currently logged in User
LoggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')

# Set ~/Library/Mobile Documents as a variable
DIR="/Users/$LoggedInUser/Library/Mobile Documents"

#  see if Mobile Documents is present && see if there are any files in Mobile Documents
if [ -d "$DIR" ] && [ "$(ls "$DIR")" ]

then
# there are files in Mobile Documents
	 echo "<result>Enabled</result>"
else
# there are no files in Mobile Documents	
		echo "<result>Disabled</result>"
fi
