#!/bin/sh
source /home/ec2-user/.bash_profile
npm=`which npm`
echo "done. npm path = $npm" >> /home/ec2-user/HEYYOU
cd /home/ec2-user/app
npm install
forever start index.js
