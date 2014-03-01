include_recipe 'apt'
include_recipe 'java'
include_recipe 'ark'
include_recipe 'runit'

ark 'dynamodb' do
  url node[:dynamodb_local][:source]
  extension 'tar.gz'
end

runit_service 'dynamodb-local-cookbook' do
  options({
    :dynamodb_local_port => node[:dynamodb_local][:port]
  })
end
