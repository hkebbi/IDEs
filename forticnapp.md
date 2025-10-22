


df -H // check disk spaces in all volumes only two are persistant /home /home/clouduser-shell

du -hs .*   //Expand to all hidden files and folders


// These are the large modules disk space consuming, you dont need them, delete them to empty space.
rm -Rf .terraform
rm -Rf .terraform.lock.hcl 

// Create tmp directory to move them during deployment but you need to have terraform
 mkdir /tmp/terraform
 ln -s /tmp/terraform .terraform



Other solution: deploy on /home not $home (/home/cloudhshell-user)

sudo mkdir -p /home/forticnapp
sudo chown -R "$USER":"$USER" /home/forticnapp
cd /home/forticnapp




Replace and download forticnapp.sh
| sudo tee forticnapp.sh > /dev/null
curl -H "Authorization: Bearer _1247539764ac3215d8a91c514835c757" https://316605.lacework.net/api/v2/Onboarding/ca5de6ce-7a83-4a95-bf7c-23229f969c2d.sh | sudo tee forticnapp.sh > /dev/null

sudo chmod +x forticnapp.sh 

sudo nano forticnapp.sh 

and # on the lacework generate line, save and exit
# "$HOME/bin/lacework" generate --output "${output_directory}" cloud-account aws --config='true' --cloudtrail='true' --aws_region='me-south-1' --noninteractive --apply --lacework_aws_account_id='434813966438'

./forticnapp.sh 


forticnapp $ lacework generate cloud-account aws default
▸ Previous IaC generation detected, load cached values? No
▸ Enable integrations for AWS organization? No
▸ Main AWS account profile: main
▸ Main AWS account region: me-south-1
▸ [Agentless] Enable Agentless integration? No
▸ [Configuration] Enable Configuration integration? Yes
▸ [Configuration] Add another AWS account? No
▸ [CloudTrail] Enable CloudTrail integration? No
▸ Custom output location (optional): .
▸ Run Terraform plan now? No
Terraform code saved in .


lacework generate cloud-account aws --output='/home/forticnapp/cloud-api' --config='true' --cloudtrail='false' --aws_region='me-south-1' --noninteractive --apply 


lacework generate cloud-account aws --output='/home/forticnapp/cloud-api' --config='true' --cloudtrail='true' --aws_region='me-south-1' --noninteractive --apply 
