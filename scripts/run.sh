#!/bin/sh
source /home/ec2-user/.bash_profile
u=$(whoami)
echo "done. I am $u" >> /home/ec2-user/HEYYOU
cd /home/ec2-user/app
npm install
forever start index.js
