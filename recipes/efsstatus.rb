ruby_block 'check_mount_target' do
    block do
      fsid = node['efs']['mounts']['/mnt']['fsid']
      region = node['efs']['mounts']['/mnt']['region']
      lifeCycState = true
      curTime = Time.now.to_i
      while lifeCycState
        data = JSON.parse `aws efs describe-mount-targets --file-system-id #{fsid} --region #{region}`
        checkArr = data["MountTargets"].collect { |ll| ll['LifeCycleState']}
        lifeCycState = (checkArr.uniq.size == 1 && checkArr.uniq[0] == "available") ? false : true
        newCurTime = Time.now.to_i
        if (newCurTime-curTime) >= 600
            Chef::Log.info("The status check timed out...")
            break
        end
      end
    end
  end
