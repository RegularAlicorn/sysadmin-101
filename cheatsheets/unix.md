# Unix
Even if you normally only work with Windows systems, you will need unix systems from time to time. There are a couple of actions you should be able to do. _This section might bore you if you are familiar with unix._

There might be version and distribution differences in commands.

## Linux on Windows
You can install WSL (Windows Subsystem for Linux) to get a Linux Kernel onto your Windows 10 machine. WSL2 is now out, you need Windows 2004 to install it. WSL2 is a true UNIX kernel, you can even run Docker and such! 

### Installation Windows 10
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

Restart-Computer
```

After the reboot open the Windows Store and install your prefered distribution. Be careful to choose the official apps (which are free).
* Ubuntu - Easy to use, widely used
* Debian - Widely used
* Kali - Penetration testing and security distro

After installation you will have to initialize the system by starting it.

## General
Unix systems use privileged commands through the "sudo" command. You prefix any command with "sudo" to gain administrative privileges.
If a command fails to execute due to permissions you might need to use "sudo".

```bash
# Change current console directory to root
cd /

# Change current console directory to home
cd ~

# List directory contents
ls

# Open some file in an (easy) text editor
# Use "sudo" if your users permission is not enough
nano <file>

# Get network interface configuration
# sudo is not always necessary
sudo ifconfig

# Reboot immediately
sudo reboot

# Update system
sudo apt-get update && sudo apt-get upgrade

# Kill a process
# Use top or ps -ef to the needed PID. Grep reduces the lists volume
ps -ef | grep firefox
kill <PID>

# Force kill
kill -9 <PID>
```

### Windows WSL specific
You can browse your Windows files through an automatic mount. Linux tools for files might be better suited for some tasks, leverage this advantage!
```bash
cd /mnt
ls
cd /mnt/<drive letter>
```

### cat
Concatenate files and display the output to standard output.
```bash
# Get usage help
man cat

# Display given file contents
cat <file>

# Scroll through a file page by page
cat <file> | more

# Show line numbers
cat -b <file>
cat -n <file>

# Show end of line characters
cat -E <file>

# Ommit consecutive blank lines
cat -s <file>

# Concatenate files
cat <file1> <file2>

# Concatenate files into a new file
cat <file1> <file2> <new file>

# Show a file in reverse order
tac <file>
```

### Distribution / Version
To find out which distribution and version you currently use
```bash
# cat takes wildcards
cat /etc/*-release

# Not all distributions include this command
lsb-release -a

# GNU sytemd based distributions
hostnamectl

# Kernel version
uname -a
uname -mrs

# Kernel and gcc version
cat /proc/version
```

### grep
GREP (Global Regular Expression Printer) is a utility tool to filter input.
```bash
# Find all rows with "Product" in File "Products.txt"
grep "Product" "Products.txt"

# Find all rows with "prod%" in File "Products.txt" (case insensitive)
# Wildcards (RegEx) * (1 or more), ? (0 or 1), . (exactly 1)
grep "Prod.*" "Products.txt" --ignore-case

# Count lines with occurence
grep -c <pattern> <file>

# Invert result
grep -v <pattern> <file>

# Count empty lines
grep -c ^$ <file>
```

### dig
The digest command is a powerful DNS utility tool and makes troubleshooting DNS problems easier.

Dig will use the nameserver specified in _/etc/resolv.conf_ unless otherwise specified.
```bash
# Get usage help
man dig

# Perform a NS query for "."
dig

# NS query for "." with given server
dig @<IP or fqdn>

# ask nameservers in config to resolve any entry type of given server, output question query (+qr)
dig +qr <FQDN to look up> any

# Ask Cloudflare to resolve MX entries of google.com
dig @1.1.1.1 google.com MX

# Get DNSSEC answer
# Check for flags to be "qr,rd,ra,ad" and status to be "NOERROR"
dig @1.1.1.1 cloudflare.com +dnssec +multi
```

### top
Displays running processes.
```bash
# Display running processes
top

# Put into background
^Z

# Get back into foreground
fg

# Only show processes of given user
top -u <username>

# Hide idle tasks
top -i
```

### User
**List all local users**
```bash
cut -d : -f 1 /etc/passwd
```
**Create a new user**
```bash
sudo adduser <new_username>
```
**Delete a user**
```bash
# remove the user object
sudo userdel <username>
# remove the home directory
sudo rm -r /home/<username>
```
**Modify a user**
```bash
# Modifiy username
usermod -l <new_username> <old_username>
# Modify password
sudo passwd <username>
# Modify shell
sudo chsh <username>
# Modify details
sudo chfn <username>
# Add to <sudo> group
adduser username sudo
# Alternative add to <sudo> group
usermod -aG sudo username
```
**List group members**
```bash
getent group <groupname>
getent group <groupname> | awk -F: '{print $4}'
```

## Ubuntu
These commands at least work on Ubuntu.

### Show disk usage
```bash
df -h
```

### File properties, metadata, ..
```bash
# details
stat <file>
# meta information
ls -lh <file>
# general
file <file>
```

### Extend disk volume group
```bash
# Check free disk space
fdisk -l
 
# Format as Linux LVM
cfdisk /dev/sda
reboot
 
# create a new partition
pvcreate /dev/sda6
 
# Display Volume Group
vgdisplay
 
# Creates a new device on volume group. Name is displayed with vgdisplay
# The number of the sda to use can vary
vgextend <vg-name> /dev/sda6
 
# Extend and make sure it fills 100%
# If you use actual numbers, there might be an error due to floating-point rounding issues
lvextend /dev/<vg-name>/root -l+100%FREE
 
# Make new disk space available
resize2fs /dev/<vg-name>/root

# For good measure
reboot
```

## Debian / Kali
Kali - available in the Windows Store - offers a wide range of useful tools for sysadmins.

### List installed packages
```bash
dpkg --list
```

### Remove all for deletion marked packages
```bash
dpkg --list | grep "^rc" | cut -d " " -f 3 | sudo xargs dpkg --purge
```
