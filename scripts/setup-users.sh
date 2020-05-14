#!/bin/bash
#
# Prereqs: a running ocp 4 cluster, logged in as kubeadmin
#
MYDIR="$( cd "$(dirname "$0")" ; pwd -P )"
function usage() {
    echo "usage: $(basename $0) [-c/--count usercount] -a/--admin-password admin_password"
}

# Defaults
USERCOUNT=10
ADMIN_PASSWORD=

USER_SUFFIX=student
USER_PASS=workshop1!

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -c|--count)
    USERCOUNT=$2
    shift # past argument
    shift # past value
    ;;
    -a|--admin-pasword)
    ADMIN_PASSWORD="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    echo "Unknown option: $key"
    usage
    exit 1
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters
echo "USERCOUNT: $USERCOUNT"
echo "ADMIN_PASSWORD: $ADMIN_PASSWORD"

if [ -z "$ADMIN_PASSWORD" ] ; then
  echo "Admin password (-a) required"
  usage
  exit 1
fi

if [ ! "$(oc get clusterrolebindings)" ] ; then
  echo "not cluster-admin"
  exit 1
fi

# adjust limits for admin
#oc delete userquota/default

# get routing suffix
TMP_PROJ="dummy-$RANDOM"
oc new-project $TMP_PROJ
oc create route edge dummy --service=dummy --port=8080 -n $TMP_PROJ
ROUTE=$(oc get route dummy -o=go-template --template='{{ .spec.host }}' -n $TMP_PROJ)
HOSTNAME_SUFFIX=$(echo $ROUTE | sed 's/^dummy-'${TMP_PROJ}'\.//g')
oc delete project $TMP_PROJ
MASTER_URL=$(oc whoami --show-server)
CONSOLE_URL=$(oc whoami --show-console)
# create users
TMPHTPASS=$(mktemp)
echo "TMPHTPASS: ${TMPHTPASS}"
#for i in {1..$USERCOUNT} ; do
#for i in seq 1 $USERCOUNT ; do
for i in $(eval echo {1..$USERCOUNT}) ;  do
    echo "Adding User ${i}"
    htpasswd -b ${TMPHTPASS} "${USER_SUFFIX}$i" "${USER_PASS}"
done

# Add openshift cluster admin user
htpasswd -b ${TMPHTPASS} admin "${ADMIN_PASSWORD}"

# Create user secret in OpenShift
! oc -n openshift-config delete secret workshop-user-secret
oc -n openshift-config create secret generic workshop-user-secret --from-file=htpasswd=${TMPHTPASS}
rm -f ${TMPHTPASS}

# Set the users to OpenShift OAuth
#oc -n openshift-config get oauth cluster -o yaml | \
  #yq d - spec.identityProviders | \
  #yq w - -s ${MYDIR}/htpass.yaml | \
  #oc apply -f -

oc apply -f htpass.yaml

# sleep for 30 seconds for the pods to be restarted
echo "Wait for 30s for new OAuth to take effect"
sleep 30

# Make the admin as cluster admin
oc adm policy add-cluster-role-to-user cluster-admin admin

oc delete secrets kubeadmin -n kube-system

# become admin
#oc login $MASTER_URL -u admin -p "${ADMIN_PASSWORD}" --insecure-skip-tls-verify

