#!/bin/sh
source /home/ec2-user/.bash_profile
echo "done" >> /home/ec2-user/HEYYOU
cd /home/ec2-user/app
npm install
forever start index.js
