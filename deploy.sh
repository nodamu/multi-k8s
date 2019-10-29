docker build -t nickadamu/multi-client:latest -t nickadamu/multi-client:$SHA ./client
docker build -t nickadamu/multi-server:latest -t nickadamu/multi-server:$SHA ./server
docker build -t nickadamu/multi-worker:latest -t nickadamu/multi-worker:$SHA ./worker

docker push nickadamu/multi-client:latest 
docker push nickadamu/multi-server:latest
docker push nickadamu/multi-worker:latest

docker push nickadamu/multi-client:$SHA 
docker push nickadamu/multi-server:$SHA
docker push nickadamu/multi-worker:$SHA

openssl aes-256-cbc -K $encrypted_1ba1eb16049b_key -iv $encrypted_1ba1eb16049b_iv -in multi-k8s-kubeconfig.yaml.enc -out multi-k8s-kubeconfig.yaml -d

kubectl --kubeconfig /home/travis/build/nodamu/multi-k8s/multi-k8s-kubeconfig.yaml apply -f k8s/

kubectl  --kubeconfig /home/travis/build/nodamu/multi-k8s/multi-k8s-kubeconfig.yaml set image deployments/client-deployment client-deployment=nickadamu/multi-client:$SHA
kubectl  --kubeconfig /home/travis/build/nodamu/multi-k8s/multi-k8s-kubeconfig.yaml set image deployments/server-deployment server-deployment=nickadamu/multi-server:$SHA
kubectl  --kubeconfig /home/travis/build/nodamu/multi-k8s/multi-k8s-kubeconfig.yaml set image deployments/worker-deployment worker-deployment=nickadamu/multi-worker:$SHA

