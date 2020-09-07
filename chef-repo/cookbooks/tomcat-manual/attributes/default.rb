default['tomcat-manual']['openjdk'] = "openjdk-11-jdk"
default['tomcat-manual']['tomcat9'] = "tomcat9"
default['tomcat-manual']['tomcat_packages'] = %w(tomcat9-admin tomcat9-docs tomcat9-user tomcat9-examples tomcat9-common)
default['tomcat-manual']['tomcat-users-location'] = "/etc/tomcat9/tomcat-users.xml"
#default['tomcat-manual']['java_home'] = "/usr/lib/jvm/java-1.11.0-openjdk-amd64"
#default['tomcat-manual']['catalina_home'] = "/opt/tomcat"
default['tomcat-manual']['adminuser'] = 'admin'
default['tomcat-manual']['adminpassword'] = 'password'
default['tomcat-manual']['adminroles'] = 'manager-gui,admin-gui'
#default['tomcat-manual']['service_file_location'] = '/etc/systemd/system/tomcat.service'


