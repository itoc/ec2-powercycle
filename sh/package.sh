#!/bin/bash

# This script packages EC2-POWERCYCLE for Lambda

ROOT_DIR="ec2-powercycle"
CLONE_URL="https://github.com/Financial-Times/ec2-powercycle.git"
BUILD_INFO="build.info"

test -d ${ROOT_DIR} && rm -rf ${ROOT_DIR}
git clone ${CLONE_URL} ${ROOT_DIR} && echo -e "\e[31mRepository cloned \e[0m" || exit 1
cd ${ROOT_DIR}
pip install requests croniter -t lib/ && echo -e "\e[31mDependencies installed \e[0m" || exit 1
echo -e "Build: ${CIRCLE_BUILD_URL}\\nRepository: ${CIRCLE_REPOSITORY_URL}" > ${BUILD_INFO}
zip -r ../${ROOT_DIR}.zip ./*.py lib/ README.md ${BUILD_INFO} && echo -e "\e[31mDeployment package built \e[0m" || exit 1



