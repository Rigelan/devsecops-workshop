oc new-project codeready
oc create -f codeready-og.yml
oc create -f codeready-sub.yml
echo "Wait for 30s for new codeready operator to take deploy"
sleep 30
oc create -f codeready-cluster.yml

