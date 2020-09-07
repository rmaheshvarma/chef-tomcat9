#
# Cookbook:: tomcat-manual
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
#
#
apt_update "update the packages" do
  ignore_failure true
  action :update
end


#sudo apt-get install openjdk-11-jdk -y
#
#Decalred the varaibles
#
openjdk = node['tomcat-manual']['openjdk'] 
tomcat  = node['tomcat-manual']['tomcat9'] 
tomcat_packages = node['tomcat-manual']['tomcat_packages']
tomcar_user_location = node['tomcat-manual']['tomcat-users-location']
service_file_location = node['tomcat-manual']['service_file_location']



apt_package openjdk do
  action :install
end

apt_package tomcat do 
  action :install
  notifies :enable, "service[#{tomcat}]"
end


service tomcat do
  action :restart
end




tomcat_packages.each do |tomcat_packages_name|
  apt_package tomcat_packages_name do
    action :install
    notifies :restart, "service[#{tomcat}]"
  end
end



cookbook_file tomcar_user_location do
  source 'tomcat-users.xml'
  action :create
  notifies :restart, "service[#{tomcat}]"
end


#template service_file_location do
#  source 'tomcat.service.erb'
#  action :create
#  notifies :restart, 'execute[reloaddaemon]'
#end

#execute 'reloaddaemon' do
#  command 'sudo systemctl daemon-reload'
#  action :nothing
#  notifies :start, 'service[#{tomcat}]'
#end





