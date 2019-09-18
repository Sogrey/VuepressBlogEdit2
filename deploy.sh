#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

echo -e "\033[32;40m [1] \033[0m commit 2 master branch"

git init
git add -A
git commit -m 'deploy master'

# 如果你想要部署到 https://USERNAME.github.io
git push -f https://github.com/Sogrey/VuepressBlogTemplate.git master

echo -e "\033[32;40m [2] \033[0m Building static files"
# 生成静态文件
npm run build

echo -e "\033[32;40m [3] \033[0m commit 2 gh-pages branch"
# 进入生成的文件夹
cd docs/

# 如果是发布到自定义域名
# echo 'www.yourwebsite.com' > CNAME

git init
git add -A
git commit -m 'deploy gh-pages'

git push -f https://github.com/Sogrey/VuepressBlogTemplate.git master:gh-pages

cd -