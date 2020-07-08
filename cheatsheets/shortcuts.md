# Keyboard Shortcuts

## General
Key combination | Effect
---|---
Ctrl + F5 | Browser reload with forced cache refresh (no-cache header)
Ctrl + Tab | Next (Browser) tab
Ctrl + Shift + Tab | Next (Browser) tab - backwards

Key combination | Effect
---|---
Win + R | Run dialog
Win + E | New explorer window
Win + Pause | "System" in control.exe
Win + Tab | Virtual Desktop Overview
Win + Shift + S | Screenshot with dragging box into clip.exe

Key combination | Effect
---|---
Alt + D | Jump to address bar (Browser & Explorer!)

Key combination | Effect
---|---
Ctrl + Shift + Esc | Open Task Manager
Ctrl + Shift + N | New Folder in Explorer
Ctrl + Shift + Enter | Run as administrator (search menu or explorer)
Ctrl + Shift + Left Click | Run as administrator (taskbar pinned items)
Ctrl + Win + B | Access program that is displaying a message in the notification area
Ctrl + Win + D | New virtual Desktop
Ctrl + Win + Arrow Right | Move one virtual Desktop up
Ctrl + Win + Arrow Left | Move one virtual Desktop down
Ctrl + Win + Shift + B | Reset graphics driver

## Poweruser menu
This menu is opened with **Win + X** or rightclick on the startmenu button (windows logo).

While it is open you press the next button from the following table.

Key | Effect
---|---
F | Apps and Features
B | Mobility Center (Presentation Mode!)
O | Power Options
V | Event Viewer
Y | System in the new settings app (PITA)
M | Device Manager
W | Network Connections in the new settings app (PITA)
K | Disk Management
G | Computer Management
I | Windows PowerShell
A | Elevated PowerShell
T | Task Manager
N | Settings in the new settings app (PITA)
E | File Explorer
S | Search (same as **Win** and start typing)
R | Run dialog
U | Shut down or sign out SUBMENU
U -> I | Sign out
U -> S | Sleep
U -> U | Shutdown
U -> R | Restart
D | Back to Desktop (minimize everything)

# Application Shortcuts
These shortcuts need to be executed in the run dialog. Most also work in the start menu search/explorer uri bar, but not all of them.

## General
Name | Application
---|---
cmd | Command Prompt
mstsc | Remote Desktop
shell:startup | Current users autostart folder
shell:common startup | Public autostart folder (executed for every user)
pktmon.exe _<command>_ | In-box, cross-component, network diagnostics tool for Windows.
perfmon | Opens Performance Monitor
eventvwr | Event Viewer
taskschd | Task Scheduler
taskmgr | Opens Task Manager
services.msc | Service Configuration
compmgmt | Computer Management
control printers | Devices and Printers in control.exe
ncpa.cpl | Network Connections in control.exe
fsmgmt | Shared Folders management
sysdm.cpl | Advanced system properties (change Hostname, Domain, ..)
gpedit | Local group policy editor
lusrmgr | Local users and groups
mmc.exe | Microsoft Management Console
msinfo32.exe | Hardware/software cnfiguration information
regedit.exe | Registry Editor
secpol.msc | Local security policy
diskmgmt.msc | Disk Management
devmgmt.msc | Device Manager
explorer . | Opens explorer at current location
explorer .\subfolder | Opens explorer at _<subfolder>_ of current location
start . | Opens a _new_ explorer at current location

## Active Directory
".msc" normally is optional; added for good measure.

Name | Application
---|---
dsa.msc | Users & Computers
dsa /DOMAIN=<domain name> | DSA connected with given domain
dsa /SERVER=<dc name> | DSA connected with given domain controller
dsac.msc | Slower, unwieldy dsa. Can handle fine grained password policies.
dnsmgmt | DNS Manager
dhcpmgmt | DHCP Management
dssite.msc | Sites & Services
sysdm.cpl | System Properties (for domain join and hostname change)
rsop.msc | Resultant Set of Policies
dompol.msc | Domain Security Policy
domain.msc | Domains & Trust
dcpol.msc | Domain Controller Security Policy
dfsgui.msc | DFS Manager
certmgr.msc | Certificates snap-in
certsrv.msc | Certification services
  
## God Mode
You can get all settings in one convenient location, unlike the mess Microsoft pulls right now with Settings and control.exe.

Create a new folder and name it exactly:
OS Language | Folder name
---|---
English OS | ``GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}``
German OS | ``Alle Aufgaben.{ED7BA470-8E54-465E-825C-99712043E01C}``

