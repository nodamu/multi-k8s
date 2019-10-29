docker build -t nickadamu/multi-client:latest -t nickadamu/multi-client:$SHA ./client
docker build -t nickadamu/multi-server:latest -t nickadamu/multi-server:$SHA ./server
docker build -t nickadamu/multi-worker:latest -t nickadamu/multi-worker:$SHA ./worker

docker push nickadamu/multi-client:latest 
docker push nickadamu/multi-server:latest
docker push nickadamu/multi-worker:latest

docker push nickadamu/multi-client:$SHA 
docker push nickadamu/multi-server:$SHA
docker push nickadamu/multi-worker:$SHA


kubectl --kubeconfig="multi-k8s-kubeconfig.yaml" apply -f k8s/

kubectl  --kubeconfig="multi-k8s-kubeconfig.yaml" set image deployments/client-deployments client-deployment=nickadamu/multi-client:$SHA
kubectl  --kubeconfig="multi-k8s-kubeconfig.yaml" set image deployments/server-deployments server-deployment=nickadamu/multi-server:$SHA
kubectl  --kubeconfig="multi-k8s-kubeconfig.yaml" set image deployments/worker-deployments worker-deployment=nickadamu/multi-worker:$SHA

