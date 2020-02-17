# ESX

## Cancel stuck VMware Tools installation from cli
If a VM is stuck on a VMware Tools installation, you can't shut down; or unmount the drive with the installatio .iso; or cancel the installation; then you can cancel it from the corresponding ESX host cli.
```bash
vim-cmd vmsvc/getallvms | grep "<vmname>"
# Read Id on the left-most column
vim-cmd vmsvc/tools.cancelinstall <vm ID>
```

# vSphere

## Configuration

### Change vSphere Password expiration notification banner
If you use your Active Directory as an Identity Source, you will get yellow notification banners on top, counting down from **30**. These settings seem in no way synced with your AD configurations.

1. Login to your vCenter as an Administrator
2. Change Location

**Linux**
```shell
# vSphere Client (HTML5)
cd /etc/vmware/vsphere-ui

# vSphere Web Client (Flash)
cd /etc/vmware/vsphere-client
```
**Windows**
```shell
# vSphere Client (HTML5)
cd %ALLUSERSPROFILE%\VMware\vCenterServer\cfg\vsphere-ui

# vSphere Web Client (Flash)
cd %ALLUSERSPROFILE%\VMware\vCenterServer\cfg\vsphere-client
```
3. Edit _webclient.properties_ and set `sso.pending.password.expiration.notification.days = <days>`. This is the number of days before the notification about expiring password _appears_. Setting this to **-1** might disable any notification.

4. Restart the service

**Linux**
```shell
# vSphere Client (HTML5)
service-control --stop vsphere-ui
service-control --start vsphere-ui

# vSphere Web Client (Flash)
service-control --stop vsphere-client
service-control --start vsphere-client
```
**Windows**
```shell
# Binary path
cd "C:\Program Files\VMware\vCenter Server\bin\"

# vSphere Client (HTML5)
service-control --stop vsphere-ui
service-control --start vsphere-ui

# vSphere Web Client (Flash)
service-control --stop vspherewebclientsvc
service-control --start vspherewebclientsvc
```
```powershell
# Using powershell
Get-Service vsphere-ui | Restart-Service -Force
Get-Service vspherewebclientsvc | Restart-Service -Force
```
