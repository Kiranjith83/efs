ruby_block 'check_mount_target' do
  block do
    fsid = node['efs']['mounts']['/mnt']['fsid']
    r = Chef::Resource::Execute.new('aws efs describe-mount-targets --file-system-id', fsid)
    data = JSON.parse(f)
    if data[:MountTargets][:LifeCycleState] == 'available'
        Chef::Log.info("********** Available if - The instance's hostname is '#{data[:MountTargets][:LifeCycleState]}' **********")
    else
        Chef::Log.info("********** Else Available if - The instance's hostname is '#{data[:MountTargets][:LifeCycleState]}' **********")
    end
  end
end
