#!/bin/sh
echo "done" >> /home/ec2-user/HEYYOU
cd /home/ec2-user/app
npm install
forever start index.js
