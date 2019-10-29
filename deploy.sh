docker build -t nickadamu/multi-client ./client
docker build -t nickadamu/multi-nginx ./nginx
docker build -t nickadamu/multi-server ./server
docker build -t nickadamu/multi-worker ./worker

docker push nickadamu/multi-client
docker push nickadamu/multi-worker
docker push nickadamu/multi-nginx
docker push nickadamu/multi-server

kubectl --kubeconfig="multi-k8s-kubeconfig.yaml" apply -f k8s/

