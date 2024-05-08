#!/bin/bash

fuser -k 3000/tcp

# Update package lists
apt update

cd /workspace/stable-diffusion-webui/extensions/sd-webui-controlnet

git pull

cd /workspace/stable-diffusion-webui

git stash

git checkout master

git pull

cd /workspace

source venv/bin/activate

pip install insightface

cd /workspace/stable-diffusion-webui

# git checkout dev

rm -r webui-user.sh

wget -O /workspace/stable-diffusion-webui/webui-user.sh https://huggingface.co/MonsterMMORPG/SECourses/raw/main/webui-user-v2.sh

cd /workspace/stable-diffusion-webui

wget https://huggingface.co/MonsterMMORPG/SECourses/resolve/main/styles.csv -O styles.csv

python relauncher.py