#!/bin/bash
#written by kiran to delete existing svc and deploy

#svc logic has cahnged

port=$(sed -n '/k8sworker]/,/k8smaster]/p' /sites/scripts/hosts | sed '1d; $d;' | awk '{print $1}')

for i in $port
do
j=$(echo "$i" | cut -d '.' -f4)

kubectl get svc -n com-att-oce-test | grep webapp-${j}
if [ $? = 0 ];then
kubectl delete svc webapp-${j} -n com-att-oce-test
else
echo "Nothing to delete..."
fi

done

kubectl get deploy -n com-att-oce-test | grep webapp
if [ $? = 0 ];then
kubectl delete deploy webapp -n com-att-oce-test
else
echo "Nothing to delete..."
fi
