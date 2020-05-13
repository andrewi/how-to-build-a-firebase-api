# !/bin/bash
# deploy_config.sh
# This script updates Firebase Environment Variables at deployment
# Note that sed on OSX and sed in Linux operate different ways
# with OSX you have to pass a dummy blank file with -i like 'sed -i "" <s command> <file>'

cd functions
sed -i 's/\(CI_PROJECT_ID\)/'$CI_PROJECT_ID'/' permissions_build.json
sed -i 's/\(CI_PRIVATE_KEY_ID\)/'$CI_PRIVATE_KEY_ID'/' permissions_build.json
sed -i 's/\(CI_PRIVATE_KEY\)/'$CI_PRIVATE_KEY'/' permissions_build.json
sed -i 's/\(CI_CLIENT_EMAIL\)/'$CI_CLIENT_EMAIL'/' permissions_build.json
sed -i 's/\(CI_CLIENT_ID\)/'$CI_CLIENT_ID'/' permissions_build.json
sed -i 's/\(CI_CLIENT_X509_CERT_URL\)/'$CI_CLIENT_X509_CERT_URL'/' permissions_build.json
cat permissions_build.json