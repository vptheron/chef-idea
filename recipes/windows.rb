
package_name = node['idea']['packagename']
download_url = node['idea']['url']
checksum = node['idea']['sha256']

#MakeNSIS Installer
package package_name do
  installer_type :custom
  checksum checksum                
  source download_url
  retries 4
  options "/S" 
end