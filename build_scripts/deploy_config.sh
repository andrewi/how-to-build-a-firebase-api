# !/bin/bash
# deploy_config.sh
# This script updates Firebase Environment Variables at deployment
# Note that sed on OSX and sed in Linux operate different ways
# with OSX you have to pass a dummy blank file with -i like 'sed -i "" <s command> <file>'

cd functions
sed -i 's/\(CI_PROJECT_ID\)/'$CI_PROJECT_ID'/' permissions_build.json
sed -i 's/\(CI_CLIENT_EMAIL\)/'$CI_CLIENT_EMAIL'/' permissions_build.json
sed -i 's/\(CI_CLIENT_ID\)/'$CI_CLIENT_ID'/' permissions_build.json
sed -i 's/\(CI_PRIVATE_KEY_ID\)/'$CI_PRIVATE_KEY_ID'/' permissions_build.json

# sed -i 's/\(CI_PRIVATE_KEY_VALUE\)/'$CI_PRIVATE_KEY_VALUE'/' permissions_build.json
ESCAPED_REPLACE=$(echo $CI_PRIVATE_KEY_VALUE | sed -e 's/[\/&]/\\&/g')
sed -i 's/\(CI_PRIVATE_KEY_VALUE\)/'$ESCAPED_REPLACE'/' permissions_build.json

echo $ESCAPED_REPLACE
cat permissions_build.json