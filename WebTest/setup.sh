image_version=`date +%Y%m%d%H%M`;
echo $image_version;
# cd WebTest
git pull --rebase origin master;
docker stop WebTest;
docker rm WebTest;
docker build -t WebTest:$image_version .;
docker images;
docker run -p 10001:80 -d --name WebTest WebTest:$image_version;
# -v ~/docker-data/house-web/appsettings.json:/app/appsettings.json -v ~/docker-data/house-web/NLogFile/:/app/NLogFile   --restart=always
docker logs WebTest;
#??build????????    #docker image prune -a -f
docker rmi $(docker images -f "dangling=true" -q)