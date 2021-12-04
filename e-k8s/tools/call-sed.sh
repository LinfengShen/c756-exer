#!/usr/bin/env bash
# Process the template variables for a single file.
# The first argument is the name of the file to process. It must include `-tpl` 
# The remaining arguments must exactly match the order of variable names
# in the `sed` expression below.
#
set -o nounset
set -o errexit
if [[ $# -lt 6 ]]
then
  echo "call-sed.sh must have at least six arguments"
  exit 1
fi
#
# Create output file name
#
out=${1/-tpl/}
#
# Replace all the variables
# The official AWS docs (https://docs.aws.amazon.com/IAM/latest/APIReference/API_AccessKey.html) state that Access Key IDs are pure alphanumeric.
# They do not restrict the Secret Access Key in any way but various sites on the Web suggest that it is only alphanumeric+slash+plus
# So it should be delimitable by '|'
sed -e "s|ZZ-CR-ID|${2}|g" -e "s|ZZ-REG-ID|${3}|g" -e "s|ZZ-AWS-REGION|${4}|g" -e "s|ZZ-AWS-ACCESS-KEY-ID|${5}|g" -e "s|ZZ-AWS-SECRET-ACCESS-KEY|${6}|g" ${1} > ${out}
