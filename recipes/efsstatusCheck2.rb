ruby_block 'check_mount_target' do
    block do
      fsid = node['efs']['mounts']['/mnt']['fsid']
      region = node['efs']['mounts']['/mnt']['region']
      r = `aws efs describe-mount-targets --file-system-id #{fsid} --region #{region}`
      data = JSON.parse(r)
      numoftar = data['MountTargets'].each do |elem|
        if elem['LifeCycleState'] == 'available'
            Chef::Log.info("********** #{elem["MountTargetId"]} is Available **********")
        else
            Chef::Log.info("********** #{elem["MountTargetId"]} is Not Available **********")
        end
      end
    end
  end
