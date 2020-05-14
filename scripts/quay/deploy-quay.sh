oc new-project quay-enterprise

#oc apply -f quay.csc.cr.yml

oc create -f quay-og.yml
oc create -f quay-sub.yml

echo "Wait for 30s for new quay operator to take deploy"
sleep 30

oc create -f redhat-pull-secret.yaml
#oc create -f service_account.yaml
#oc create -f cluster_role.yaml
#oc create -f cluster_role_binding.yaml
oc create -f role.yaml
oc create -f role_binding.yaml

#oc create secret generic custom-quay-ssl --from-file=ssl.key=certs/ssl.key --from-file=ssl.cert=certs/ssl.cert

oc create -f quay_cr.yml
