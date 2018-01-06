#Chef::Log.info("********** The instance AWS Instance id is  '#{node["opsworks"]["instance"]["aws_instance_id"]}'  **********")
Chef::Log.info("********** The instance AWS Instance id is  '#{node["ec2"]["instance_id"]}'  **********")
