ruby_block 'check_mount_target' do
    block do
      fsid = node['efs']['mounts']['/mnt']['fsid']
      r = `aws efs describe-mount-targets --file-system-id fs-846865cd --region us-east-1`
      data = JSON.parse(r)
      if data[:MountTargets][0][:LifeCycleState] == 'available'
          Chef::Log.info("********** Available if - The instance's hostname is '#{data[:MountTargets][:LifeCycleState]}' **********")
      else
          Chef::Log.info("********** Else Available if - The instance's hostname is '#{data[:MountTargets][:LifeCycleState]}' **********")
      end
    end
  end
