#!/bin/sh
cd /home/ec2-user/app
npm install
forever start index.js
