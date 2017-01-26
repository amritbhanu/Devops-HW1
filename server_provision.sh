#! /bin/bash

echo "Installing node and npm on localmachine"
brew install node

echo "Installing needle and aws-sdk"
cd ./do
npm install --save

cd ../aws
npm install --save

cd ../

echo "Dependencies have been installed"
echo "Provisioning Digital Ocean Server"
node do/CreateDroplet.js

echo "Provisioning AWS Server"
node aws/CreateInstance.js

#echo "Configuring servers Digital Ocean and AWS"

#cd ./ansible/
#ansible-playbook playbook.yml -i inventory
