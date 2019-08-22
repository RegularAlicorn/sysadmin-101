# VSphere

## Change vSphere Password expiration notification banner
If you use your Active Directory as an Identity Source, you will get yellow notification banners on top, counting down from **30**. These settings seem in no way synced with your AD configurations.

1. Login to your vCenter as an Administrator
2. Change Location

Linux | Windows
---------------
```
// vSphere Client (HTML5)
cd /etc/vmware/vsphere-ui

// vSphere Web Client (Flash)
cd /etc/vmware/vsphere-client
``` | ```
// vSphere Client (HTML5)
cd %ALLUSERSPROFILE%\VMware\vCenterServer\cfg\vsphere-ui

// vSphere Web Client (Flash)
cd %ALLUSERSPROFILE%\VMware\vCenterServer\cfg\vsphere-client
```
