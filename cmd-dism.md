# DISM

DISM.exe (Deployment Image Servicing and Management) is a native Microsoft commandline tool to manipulate Windows images.

## What images can you manipulate?

Most of the time DISM is used to work with images for Windows PE, Windows RE (Recovery Environment) and Windows Setup. DISM is not limited to these versions and can be used on any modern Windows environment.

## How can you use DISM in cmd/PowerShell?

DISM.exe is located in %systemroot%\system32 . Any binary (.exe) in this folder is automatically loaded into your cmd/PowerShell session and can be used without a path and just the name. Dism needs administrative privileges, hence you have to call it within an elevated prompt.
To get a quick overview of typical commands, type `dism /?` into an elevated command prompt. You will receive a list of available commands.
There is lots of things you can do with this workhorse of a command!

## How do you know, which edition you use?

You can get the current used edition with `dism /Online /Get-CurrentEdition`.

## Remove evaluation flag

Recent Windows images you download often are evaluation versions. If you install one of these, you get a permanent text in the bottom right corner, which specifies at least that this image has evaluation purpose. To get these images license compliant - and not have them turn off after the gracious period - we have to remove the evaluation flag and set the according edition we want.
First we have to check available version for our image. For this we need to use the /Online portion of the tool.
To see available commands, check `dism /Online /?`.
* check available editions with `dism /Online /Get-TargetEditions`. The output displays all available target editions, for example ServerStandard, ServerDatacenter, ProfessionalEducation, Enterprise and more.
* decide which edition is required for you license model. Check with your license manager if unsure!
* change your image edition with `dism /Online /Set-TargetEdition: /ProductKey:<product key> /AcceptEula

## Is there a way to install a Windows OS and license it later?

With volume licensed Windows, yes! While you have to license your OS you can use it for 180 days before the grace period expires.
During GUI-Setup you can skip the step for the product key. If you use dism to change the edition you will have to provide a valid product key. You can use special installation keys provided by Microsoft. Check [these Docs](https://docs.microsoft.com/en-us/windows-server/get-started/kmsclientkeys).

## Can you extend the grace period?

Yes, use `slmgr /rearm` to reset the grace period to 180 days. This is possible for up to 3 times

## Can you insert a driver into your newly created image?

You can insert a driver into a Windows image with the following command:
```
DISM.exe /image:"c:\images\Image1" /Add-Driver /ForceUnsigned /DriverName:"C:\Drivers\1.inf" /DriverName:"C:\Drivers\2.inf" /DriverName:"C:\Drivers\3.inf"
```
