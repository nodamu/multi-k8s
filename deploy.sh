docker build -t nickadamu/multi-client:latest -t nickadamu/multi-client:$SHA ./client
docker build -t nickadamu/multi-server:latest -t nickadamu/multi-server:$SHA ./server
docker build -t nickadamu/multi-worker:latest -t nickadamu/multi-worker:$SHA ./worker

docker push nickadamu/multi-client:latest 
docker push nickadamu/multi-server:latest
docker push nickadamu/multi-worker:latest

docker push nickadamu/multi-client:$SHA 
docker push nickadamu/multi-server:$SHA
docker push nickadamu/multi-worker:$SHA


