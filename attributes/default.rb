default['efs']['rsize'] = 1_048_576
default['efs']['wsize'] = 1_048_576
default['efs']['behavior'] = 'hard'
default['efs']['timeout'] = 600
default['efs']['retrans'] = 2
default['efs']['mounts'] = '/mnt'
default['efs']['mounts']['/mnt']['fsid'] = 'fs-846865cd' 
default['efs']['mounts']['/mnt']['region'] = 'us-east-1'
default['efs']['remove_unspecified_mounts'] = false

default['efs']['nfs-package'] = case node['platform_family']
                                when 'ubuntu', 'debian'
                                  'nfs-common'
                                when 'redhat'
                                  'nfs-utils'
                                end
