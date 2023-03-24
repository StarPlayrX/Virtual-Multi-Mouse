#!/bin/bash

#  install.sh
#  
#
#  Created by Todd Bruss on 3/24/23.
#  

# remove previous if they exist

userdata='/userdata/system/'
script='custom.sh'

# Cleanup our mess
rm -Rf $userdata$script

echo removing $userdata$script
echo 
