image_version=`date +%Y%m%d%H%M`;
echo $image_version;
# cd webtest
git pull --rebase origin master;
docker stop webtest;
docker rm webtest;
docker build -t webtest:$image_version .;
docker images;
docker run -p 10001:80 -d --name webtest webtest:$image_version;
# -v ~/docker-data/house-web/appsettings.json:/app/appsettings.json -v ~/docker-data/house-web/NLogFile/:/app/NLogFile   --restart=always
docker logs webtest;
#??build????????    #docker image prune -a -f
docker rmi $(docker images -f "dangling=true" -q)