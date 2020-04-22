#!/bin/bash
# source: https://github.com/oracle/oci-cli/blob/master/services/database/examples_and_test_scripts/database_atp_adw_examples.sh

# Below are sample values. Please update if needed.
COMPARTMENT_ID=""
DISPLAY_NAME1="displayName"
PASSWORD1=""
CPU="1"
#SCALED_CPU="2"
#SCALED_STORAGE="2"
STORAGE="1"
LICENSE_TYPE="LICENSE_INCLUDED"
#AUTO_SCALE=true
#PREVIEW=true
FREETIER=true
FREE_DB_NAME=freedb
#SUBNETID="subnetID"
#NSGID="["nsgID1"]"
#UPDATENSGID="["nsgID2","nsgID3"]"

##############################################################################Autonomous Transaction Processing##############################################################################

echo 'Starting Autonomous Transaction Processing Examples'

echo 'Create Autonomous Transaction Processing...'

echo 'Create Free Autonomous Transaction Processing...'
CREATE_FREE_ATP=$(oci db autonomous-database create -c $COMPARTMENT_ID --db-name $FREE_DB_NAME --admin-password $PASSWORD1 --cpu-core-count $CPU \
                    --data-storage-size-in-tbs $STORAGE --display-name $DISPLAY_NAME1 --license-model $LICENSE_TYPE --is-free-tier $FREETIER \
                    --wait-for-state AVAILABLE)

echo "Created Free Autonomous Transaction Processing with OCID:"
echo $CREATE_FREE_ATP

echo "Created Autonomous Transaction Processing Preview with OCID:"
echo $CREATE_ATP_PREVIEW

echo 'List all Autonomous Transaction Processings in compartment'
oci db autonomous-database list --compartment-id $COMPARTMENT_ID

#echo 'Delete Autonomous Transaction Processing'
#oci db autonomous-database delete --autonomous-database-id $ADB_ID_PE --force --wait-for-state TERMINATED
#echo 'Delete Autonomous Transaction Processing'
