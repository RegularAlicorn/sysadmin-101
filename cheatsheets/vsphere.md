# VSphere

## Change vSphere Password expiration notification banner
If you use your Active Directory as an Identity Source, you will get yellow notification banners on top, counting down from **30**. These settings seem in no way synced with your AD configurations.

1. Login to your vCenter as an Administrator
2. Change Location

**Linux**
```
// vSphere Client (HTML5)
cd /etc/vmware/vsphere-ui

// vSphere Web Client (Flash)
cd /etc/vmware/vsphere-client
```
**Windows**
```
// vSphere Client (HTML5)
cd %ALLUSERSPROFILE%\VMware\vCenterServer\cfg\vsphere-ui

// vSphere Web Client (Flash)
cd %ALLUSERSPROFILE%\VMware\vCenterServer\cfg\vsphere-client
```
3. Edit _webclient.properties_ and set `sso.pending.password.expiration.notification.days = <days>`. This is the number of days before the notification about expiring password _appears_. Setting this to **-1** might disable any notification.

4. Restart the service
**Linux**
```
// vSphere Client (HTML5)
service-control --stop vsphere-ui
service-control --start vsphere-ui

// vSphere Web Client (Flash)
service-control --stop vsphere-client
service-control --start vsphere-client
```
**Windows**
```
cd "C:\Program Files\VMware\vCenter Server\bin\"
// vSphere Client (HTML5)
service-control --stop vsphere-ui
service-control --start vsphere-ui

// vSphere Web Client (Flash)
service-control --stop vspherewebclientsvc
service-control --start vspherewebclientsvc

// Using powershell
Get-Service vsphere-ui | Restart-Service -Force
Get-Service vspherewebclients | Restart-Service -Force
```
