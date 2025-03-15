

## 2025-03-08 05:24


compile anduril using wsl?


please read the OG `README.md` file


quoted:
```

## Compiling


The firmware can be deeply customized by modifying it and compiling your own
versions, and this is encouraged.

To compile the firmware, it is strongly recommended that you use a Linux
computer, ideally running Debian or Ubuntu (but almost any distro should work).
Virtual machines work well, such as running WSL inside Windows.  There is also
a Docker container available (TODO: add link(s) here), if that is more
convenient.





### Prerequisites:

- AVR toolchain packages:  
  `sudo apt install gcc-avr avr-libc binutils-avr`

- Other misc packages:  
  `sudo apt install git wget unzip bash`

- Atmel DFPs (Device Family Packs).  A small script is included to
  download and install these for you:  
  `./make dfp`





### Building

Use the `make` script included in this repo.  Run `./make --help` for details
about how to use it.  In most cases though, you should be able to just run
`./make` by itself to compile all available build targets.  Or give it a search
term to limit builds to only a few, like `./make hank boost` to build all
firmwares for Hanklights with optional boost drivers.

The compiled firmware goes into the `hex/` directory, ready to be used by any
firmware flashing program.

```






"cd" to this dir first:  
`D:\2025-GH-A2\gk-137e`



like **this:**    

```


cd D:\2025-GH-A2\gk-137e


```




then this:  

```

wsl


```





#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   





next:
```

unix35@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$ ./make --help



Anduril make: a build helper tool for Anduril flashlight firmware

Usage: ./make TASK

... where TASK is:

  help            Show this help text
  (nothing)       Compile all build targets
  flash FILE      Flash firmare FILE to a hardware device
  clean           Delete generated files
  dfp             Download and install Atmel DFPs
  docs            Convert all .md files to .html
  models          Generate the MODELS file
  release         Zip up all .hex files to prep for publishing a release
  version         Show the current version string
  todo            Show tasks noted in source code files

... or TASK can be the partial name of a build target.



Examples:

  # get rid of old clutter files
  ./make clean
  # compile all anduril build targets
  ./make anduril
  # compile all builds matching "emisar" AND "nofet"
  ./make emisar nofet
  # compile all builds matching "q8" (i.e. Sofirn BLF Q8)
  ./make q8
  # Flash the Q8 firmware built in the previous command
  # (copy/paste the file path printed by the build script)
  ./make flash hex/sofirn-blf-q8.hex


unix35@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$


```






next:

`./make clean`  ?

let's try that one ( `./make clean` )


```

unix35@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$ ./make clean


rm -vf -- **/*~ hex/*.hex ui/**/*.elf ui/**/*.o ui/**/*.cpp


removed 'hex/a2.250303.000247.mateminco-mt35-mini.hex'
removed 'hex/a2.250303.000250.sofirn-blf-lt1-t1616-og.hex'
removed 'hex/a2.250303.000253.sofirn-blf-lt1-t1616-starry.hex'
removed 'hex/a2.250303.000256.sofirn-blf-q8-t1616.hex'
removed 'hex/a2.250303.000259.sofirn-sc21-pro.hex'
removed 'hex/a2.250303.000302.sofirn-sc31-pro-t1616.hex'
removed 'hex/a2.250303.000304.sofirn-sp10-pro.hex'
removed 'hex/a2.250303.000306.sofirn-sp36-t1616.hex'
removed 'hex/a2.250303.000309.wurkkos-fc13.hex'
removed 'hex/a2.250303.000311.wurkkos-ts10-rgbaux-lowfet.hex'
removed 'hex/a2.250303.000314.wurkkos-ts10-rgbaux.hex'
removed 'hex/a2.250303.000316.wurkkos-ts10.hex'
removed 'hex/a2.250303.000319.wurkkos-ts11.hex'
removed 'hex/a2.250303.000321.wurkkos-ts21.hex'
removed 'hex/a2.250303.000324.wurkkos-ts25.hex'
removed 'hex/a2.250304.033545.wurkkos-ts25.hex'
removed 'hex/a2.250304.033702.wurkkos-fc13.hex'
removed 'hex/a2.250304.033704.wurkkos-ts10-rgbaux-lowfet.hex'
removed 'hex/a2.250304.033708.wurkkos-ts10-rgbaux.hex'
removed 'hex/a2.250304.033710.wurkkos-ts10.hex'
removed 'hex/a2.250304.033713.wurkkos-ts11.hex'
removed 'hex/a2.250304.033716.wurkkos-ts21.hex'
removed 'hex/a2.250304.033718.wurkkos-ts25.hex'
removed 'hex/a2.250304.035011.mateminco-mt35-mini.hex'
removed 'hex/a2.250304.035014.sofirn-sc21-pro.hex'
removed 'hex/a2.250304.035016.sofirn-sc31-pro-t1616.hex'
removed 'hex/a2.250304.035019.wurkkos-fc13.hex'
removed 'hex/a2.250304.041016.mateminco-mt35-mini.hex'
removed 'hex/a2.250304.041019.sofirn-blf-lt1-t1616-og.hex'
removed 'hex/a2.250304.041021.sofirn-blf-lt1-t1616-starry.hex'
removed 'hex/a2.250304.041024.sofirn-blf-q8-t1616.hex'
removed 'hex/a2.250304.041027.sofirn-sc21-pro.hex'
removed 'hex/a2.250304.041029.sofirn-sc31-pro-t1616.hex'
removed 'hex/a2.250304.041032.sofirn-sp10-pro.hex'
removed 'hex/a2.250304.041035.sofirn-sp36-t1616.hex'
removed 'hex/a2.250304.041037.wurkkos-fc13.hex'
removed 'hex/a2.250304.041040.wurkkos-ts10-rgbaux-lowfet.hex'
removed 'hex/a2.250304.041042.wurkkos-ts10-rgbaux.hex'
removed 'hex/a2.250304.041045.wurkkos-ts10.hex'
removed 'hex/a2.250304.041048.wurkkos-ts11.hex'
removed 'hex/a2.250304.041050.wurkkos-ts21.hex'
removed 'hex/a2.250304.041052.wurkkos-ts25.hex'


removed 'ui/anduril/anduril.elf'
removed 'ui/anduril/anduril.o'
removed 'ui/anduril/anduril.cpp'



unix35@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$




```




#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   




next:

./make q8


.  


**IT FAILED!**




./make --help





.   
.   
.   





```

# fav command : clear

clear





./make help

./make

./make flash

./make clean

./make dfp

./make docs

./make models

./make release

./make version

./make todo




# REFERENCES:


  help            Show this help text

  (nothing)       Compile all build targets

  flash FILE      Flash firmare FILE to a hardware device

  clean           Delete generated files

  dfp             Download and install Atmel DFPs

  docs            Convert all .md files to .html

  models          Generate the MODELS file

  release         Zip up all .hex files to prep for publishing a release

  version         Show the current version string

  todo            Show tasks noted in source code files



```



# take care of the dfp thingy:  



clear


./make help


./make q8




#  PLEASE TAKE CARE OF THE  `Prerequisites`


**PLEASE TAKE CARE OF THE**  `Prerequisites`



```

sudo apt install gcc-avr avr-libc binutils-avr

sudo apt install git wget unzip bash

./make dfp




### Prerequisites:

- AVR toolchain packages:  
  `sudo apt install gcc-avr avr-libc binutils-avr`

- Other misc packages:  
  `sudo apt install git wget unzip bash`

- Atmel DFPs (Device Family Packs).  A small script is included to
  download and install these for you:  
  `./make dfp`



```








#  2025-03-08 09:15









#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   








PS C:\> wsl -l -v

  NAME              STATE           VERSION
* Debian            Running         2
  docker-desktop    Stopped         2
  Ubuntu            Stopped         2

PS C:\>











#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   



#  run Ubuntu:


wsl.exe

--distribution



wsl.exe --distribution Ubuntu





```

PS C:\>

PS C:\> wsl.exe --distribution Ubuntu


To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.167.4-microsoft-standard-WSL2 x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sat Mar  8 09:53:05 +07 2025

  System load:  0.08               Processes:             9
  Usage of /:   0.4% of 250.92GB   Users logged in:       0
  Memory usage: 9%                 IPv4 address for eth0: 172.28.24.169
  Swap usage:   0%

0 updates can be installed immediately.
0 of these updates are security updates.


The list of available updates is more than a week old.
To check for new updates run: sudo apt update


This message is shown once once a day. To disable it please create the /home/unix21/.hushlogin file.



unix21@HPP-SW:/mnt/c$

```




```
### Prerequisites:

- AVR toolchain packages:  
  `sudo apt install gcc-avr avr-libc binutils-avr`

- Other misc packages:  
  `sudo apt install git wget unzip bash`

- Atmel DFPs (Device Family Packs).  A small script is included to
  download and install these for you:  
  `./make dfp`

```







```

PS C:\> wsl -d ubuntu
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

unix21@HPP-SW:/mnt/c$

```




```

To fix the "E: Unable to locate package gcc-avr" error in WSL Debian, 

first **update** the package lists with 

`sudo apt update`



and then **upgrade** your packages with 

`sudo apt upgrade`


.  




If the issue persists, 

ensure you have the correct repositories enabled 

and try installing the package again. 



Here's a more detailed breakdown:



1. Update Package Lists:
Open a terminal in your WSL Debian environment.
Run the following command to update the package lists:
Code

    sudo apt update
This command downloads the latest package information from the repositories. Upgrade your packages. 
Code

    sudo apt upgrade
This command upgrades the packages that have newer versions available. 


```





**this one seems done:**
```

- AVR toolchain packages:  
  `sudo apt install gcc-avr avr-libc binutils-avr`

sudo apt install gcc-avr avr-libc binutils-avr

```





**this is done too ?**
```

- Other misc packages:  
  `sudo apt install git wget unzip bash`

sudo apt install git wget unzip bash


```





**this is done (maybe?)**
```


- Atmel DFPs (Device Family Packs).  A small script is included to
  download and install these for you:  
  `./make dfp`

```







#####   #####   #####   #####   #####   #####   #####   



clear

./make help

./make q8

./make ts25







#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   






2025-03-08 11:58


unix35@HPP-SW:~$



```
### Prerequisites:

- AVR toolchain packages:  
  `sudo apt install gcc-avr avr-libc binutils-avr`

- Other misc packages:  
  `sudo apt install git wget unzip bash`

- Atmel DFPs (Device Family Packs).  A small script is included to
  download and install these for you:  
  `./make dfp`

```




```

sudo apt install gcc-avr avr-libc binutils-avr

sudo apt install git wget unzip bash

./make dfp

```





```

To fix the "E: Unable to locate package gcc-avr" error in WSL Debian, 

first **update** the package lists with 

`sudo apt update`



and then **upgrade** your packages with 

`sudo apt upgrade`

```





sudo apt update


sudo apt upgrade




sudo apt install gcc-avr avr-libc binutils-avr

sudo apt install git wget unzip bash



#####################################





sudo apt update

sudo apt update && sudo apt upgrade



sudo add-apt-repository main




#####   #####   #####   #####   #####   #####   #####   




unix35@HPP-SW:/mnt/c$ sudo adduser debian51

Adding user `debian51' ...
Adding new group `debian51' (1002) ...
Adding new user `debian51' (1001) with group `debian51' ...


Creating home directory `/home/debian51' ...

Copying files from `/etc/skel' ...

Enter new UNIX password: deb252525





#####   #####   #####   #####   #####   #####   #####   




sudo adduser debian51


debian config --default-user debian51


wsl -d debian




#####   #####   #####   #####   #####   #####   #####   





debian config --default-user debian51


wsl -d debian



turn debian51 into SUDOER
```
PS C:\> wsl -u root
root@HPP-SW:/mnt/c#
root@HPP-SW:/mnt/c# usermod -a -G sudo debian51
root@HPP-SW:/mnt/c#
```




sudo adduser debian55





```

PS C:\> wsl -u debian51
debian51@HPP-SW:/mnt/c$

debian51@HPP-SW:/mnt/c$ sudo adduser debian55

[sudo] password for debian51:

Adding user `debian55' ...
Adding new group `debian55' (1003) ...
Adding new user `debian55' (1002) with group `debian55' ...

Creating home directory `/home/debian55' ...
Copying files from `/etc/skel' ...


Enter new UNIX password: deb252525
Retype new UNIX password:
passwd: password updated successfully


Changing the user information for debian55


Enter the new value, or press ENTER for the default
        Full Name []:
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:


Is the information correct? [Y/n] y

debian51@HPP-SW:/mnt/c$

```






//  usermod -a -G sudo debian55
//  usermod: Permission denied.
```
PS C:\> wsl -d debian
debian51@HPP-SW:/mnt/c$

debian51@HPP-SW:/mnt/c$ usermod -a -G sudo debian55
usermod: Permission denied.
usermod: cannot lock /etc/passwd; try again later.

debian51@HPP-SW:/mnt/c$

```



wsl -u root
```

PS C:\> wsl -u root
root@HPP-SW:/mnt/c#
root@HPP-SW:/mnt/c# usermod -a -G sudo debian55
root@HPP-SW:/mnt/c#


```



test:
```

sudo apt update

sudo apt upgrade

```






#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   




///   2025-03-08 13:39


```
//  terminate a distro
PS D:\2025-GH-A2\gk-137e> wsl -t debian
The operation completed successfully.

// delete a distro
PS D:\2025-GH-A2\gk-137e> wsl --unregister debian
Unregistering.
The operation completed successfully.

// list installed distro
PS D:\2025-GH-A2\gk-137e> wsl -l -v
  NAME              STATE           VERSION
* docker-desktop    Stopped         2
  Ubuntu            Stopped         2


// check available distro oinline
PS D:\2025-GH-A2\gk-137e> wsl -l -o
The following is a list of valid distributions that can be installed.
Install using 'wsl.exe --install <Distro>'.

NAME                            FRIENDLY NAME
Debian                          Debian GNU/Linux
SUSE-Linux-Enterprise-15-SP5    SUSE Linux Enterprise 15 SP5
SUSE-Linux-Enterprise-15-SP6    SUSE Linux Enterprise 15 SP6
Ubuntu                          Ubuntu
Ubuntu-24.04                    Ubuntu 24.04 LTS
kali-linux                      Kali Linux Rolling
openSUSE-Tumbleweed             openSUSE Tumbleweed
openSUSE-Leap-15.6              openSUSE Leap 15.6
Ubuntu-18.04                    Ubuntu 18.04 LTS
Ubuntu-20.04                    Ubuntu 20.04 LTS
Ubuntu-22.04                    Ubuntu 22.04 LTS
OracleLinux_7_9                 Oracle Linux 7.9
OracleLinux_8_7                 Oracle Linux 8.7
OracleLinux_9_1                 Oracle Linux 9.1



// install debian
PS D:\2025-GH-A2\gk-137e> wsl.exe --install debian
Downloading: Debian GNU/Linux
Installing: Debian GNU/Linux
Distribution successfully installed. It can be launched via 'wsl.exe -d Debian'




//  launched
PS C:\> wsl -d debian

Please create a default UNIX user account. The username does not need to match your Windows username.

For more information visit: https://aka.ms/wslusers

Enter new UNIX username: debian51

New password:

Retype new password:

passwd: password updated successfully

debian51@HPP-SW:/mnt/c$
```





#####   #####   #####   #####   #####   #####   #####   



2025-03-08 13:46


### Prerequisites:
```
### Prerequisites:

- AVR toolchain packages:  
  `sudo apt install gcc-avr avr-libc binutils-avr`

- Other misc packages:  
  `sudo apt install git wget unzip bash`

- Atmel DFPs (Device Family Packs).  A small script is included to
  download and install these for you:  
  `./make dfp`

```




```

sudo apt install gcc-avr avr-libc binutils-avr

sudo apt install git wget unzip bash

./make dfp

```



//   2025-03-08 15:09
///   python?
```
sudo apt install python-is-python3
```




///  2025-03-08 16:20
```
sudo apt install zip
```











#####   #####   #####   #####   #####   #####   #####   



2025-03-08 13:46


//   sudo apt install gcc-avr avr-libc binutils-avr
```
debian51@HPP-SW:/mnt/c$

debian51@HPP-SW:/mnt/c$ sudo apt install gcc-avr avr-libc binutils-avr

[sudo] password for debian51:

Reading package lists... Done

Building dependency tree... Done

The following additional packages will be installed:

  libmpc3 libmpfr6

Suggested packages:

  binutils gcc-doc gcc

The following NEW packages will be installed:

  avr-libc binutils-avr gcc-avr libmpc3 libmpfr6

0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.

Need to get 22.5 MB of archives.

After this operation, 131 MB of additional disk space will be used.

Do you want to continue? [Y/n]
```
OK, DONE.




//  NEXT:
//  sudo apt install git wget unzip bash
```
debian51@HPP-SW:/mnt/c$ sudo apt install git wget unzip bash

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

bash is already the newest version (5.2.15-2+b7).


0 upgraded, 36 newly installed, 0 to remove and 0 not upgraded.

Need to get 23.6 MB of archives.

After this operation, 118 MB of additional disk space will be used.

Do you want to continue? [Y/n]


done.

debian51@HPP-SW:/mnt/c$

```
DONE!




```
debian51@HPP-SW:/mnt/c$

debian51@HPP-SW:/mnt/c$ cd /mnt/d

debian51@HPP-SW:/mnt/d$
```



D:\2025-GH-A2\gk-137e
```
debian51@HPP-SW:/mnt/d$ cd 2025-GH-A2/gk-137e

debian51@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$ ./make q8


    # 8ebd86482462fd21b825e9fca0e133c2
    > hex/a2.250308.205701.sofirn-blf-q8-t1616.hex

    OK: sofirn-blf-q8-t1616 build succeeded


===== 1 builds succeeded, 0 failed =====

SUCCEEDED:  sofirn-blf-q8-t1616.

=============   COMPLETE   =============


debian51@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$

````





// WURKKOS UNITS
```
debian51@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$ ./make wurkkos


===== 7 builds succeeded, 0 failed =====

SUCCEEDED:  wurkkos-fc13. wurkkos-ts10. wurkkos-ts10-rgbaux. wurkkos-ts10-rgbaux-lowfet. wurkkos-ts11. wurkkos-ts21. wurkkos-ts25.

=============   COMPLETE   =============


debian51@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$

```


#####   #####   #####   #####   #####   #####   #####   



//  2025-03-08 14:06


debian config --default-user debian51




    --distribution, -d <DistroName>
        Run the specified distribution.
```
wsl -d debian
```




    --user, -u <UserName>
        Run as the specified user.
```
wsl -u debian51
```




    --manage <Distro> <Options...>
        Changes distro specific options.

        Options:
            --set-default-user <Username>
                Set the default user of the distribution.
```
wsl --manage --set-default-user debian51
```




    --set-default, -s <Distro>
        Sets the distribution as the default.
```
wsl -s debian
```






    --terminate, -t <Distro>
        Terminates the specified distribution.

    --unregister <Distro>
        Unregisters the distribution and deletes the root filesystem.



/// 2025-03-08
```
debian51@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$
debian51@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$

/mnt/d/2025-GH-A2/gk-137e

cd /mnt/d/2025-GH-A2/gk-137e

```




/// 2025-03-08
```
debian51@HPP-SW:/mnt/d/2025-GH-A2/gk-137e$



debian51@HPP-SW:/mnt/d/2025-GH-A2/gk-137

/mnt/d/2025-GH-A2/gk-137

cd /mnt/d/2025-GH-A2/gk-137



cd D:\2025-GH-A2\gk-137

wsl

./make ts25



```















.  

.  

.  




#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   






#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   






#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   






#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   

#####   #####   #####   #####   #####   #####   #####   





.   
.   
.   

Create README02.md
---

README02.md  

.   
.   
.   

README--a2-137.md  
---



.   
.   
.   



2025-02-24 

README--gk-137.md  
---

NOTE:

unable to compile ts25 with candle-mode enabled
---

- all other features are OK 
   - ver-check-mode (custom version-check-mode in blinky group) OK,
   - BEACONN-mode (BEACON-MODE IN STROBE GROUP) OK. 

- compile ts25 with candle-mode enabled: failed.
- edit some files, test compile again: OK.
  - edited filess:
    - candle-mode.h : additional lines copied from  starryalley  candle-mode.h 
    - misc.c  :  additional lines copied from  starryalley  misc.c 
    - misc.h  :  additional lines copied from  starryalley  misc.h 









.   
.   
.   

2025-02-23 

README--gk-137.md  
---

**BEWARE!**  
**THIS README IS A MESS.**  
**THIS REPO IS A MESS. BUT USABLE. ALL BUILD TAREGTS COMPILE OK.**


This is a secondary README file, contains info on the mods of this specific branch, gk-137.  

I was using GitKraken on my laptop, click this and that, created a local repo, created a remote repo, playing around, etc. etc.  


And created a remote repo: **GK-a2mods**.  
With a branch in it: **GK-a2-137**.  
Or was it gk-a2-137?  
I'm not sure.  
I'm kinda lost.  


On my android phone I created another branch on this remote repo. The new branch is **gk-137**.  
I use PuppyGit on my phone.  
Deleted the older branch.  
Blah blah blah ...

So, now this **GK-a2mods** repo has one branch. 


https://github.com/vygr-1/GK-a2mods

[vygr-1 GK-a2mods repository](https://github.com/vygr-1/GK-a2mods)

Want to clone this repo? No, you don't.  
https://github.com/vygr-1/GK-a2mods.git 

[This repo has 1 branch:](https://github.com/vygr-1/GK-a2mods/branches/all)

[GK-a2mods one branch (https://github.com/vygr-1/GK-a2mods)](https://github.com/vygr-1/GK-a2mods)






Please bear in mind, I'm still learning this Git, GitHub, GitHub Desktop, git GUI, PuppyGit, etc. etc.  ...   

I often get lost and accidentally/unintentionally doing weird things, e.g. create a new branch instead of push to the existing one. 
Create new repo. Copying. Cloning. 


If you try to compile from this source, it may not work as intended, or it may NOT work at all. 



###   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///  
###   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///  
###   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///  



2025-02-23
---

A major milestone on this branch.  
Test compiled some build targets. 

All of my wurkkos build targess compiled OK.

There were some errors and failures with wurkkos-ts10-rgbaux and wurkkos-ts10-rgbaux-low fet.  

Problems with the anduril.h, hwdef.h, hwdef.c files.

Not very diffiult to solve.

My wurkkos build targets:
1. wurkkos-fc11
2. wurkkos-ts10
3. wurkkos-ts10-rgbaux
4. wurkkos-ts10-rgbaux-lowfet
5. wurkkos-ts11
6. wurkkos-ts21
7. wurkkos-ts25



I will not be able to test all of them.
I only have a few wurkkos units:
1. wurkkos-ts10
2. wurkkos-ts10-v2  (ts10-rgbaux ?)
3. wurkkos hd10       (ts10-rgbaux ?)
4. wurkkos-ts11
5. wurkkos-ts21
6. wurkkos-ts25



I have updated my Sofirn SC31 Pro t1616. But recently don't play much with it. Recently I more ofter doing reflash on my TS11 and TS25.  
Mainly TS25, playing/experimenting/modding anduril2 on it.  



###   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///  
###   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///  
###   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///  



This branch is anduril2 with some mods,
quite a lot of mods, but it has the same file structure
as the original ToyKeeper anduril2.

[ToyKeeper anduril (https://github.com/ToyKeeper/anduril)](https://github.com/ToyKeeper/anduril) 



###   ///   ///   ///   ///   ///   ///   ///   ///   ///   ///  



For comparison, my other branch, a-327, a-331,
in another repo,
it was my experiment with moving some files and folders.
it doesn't have ui/ directory. i moved anduril/ directory 
up to the root,
and deleted everything else including the ui/ directory.


It's something like this:

```
   .build-anduril/
   arch/
   anduril/
   bin/
   dfp/
   docs/
   fsm/
   hw/
    -wurkkos-ts10/
    -wurkkos-ts11/
    -etc. etc.
```


Hei, why am i talking about a2-325 branch here?
That branch is no longer exists. But there's similar branch in another repo:

**a2mods**  Repository:

https://github.com/vygr-1/a2mods

[vygr-1 a2mods repository](https://github.com/vygr-1/a2mods)

Want to clone this repo?  I don't think so.  
https://github.com/vygr-1/a2mods.git

[This repo has 1 branch:](https://github.com/vygr-1/a2mods/branches/all)

[a2mods, one branch (https://github.com/vygr-1/a2mods)](https://github.com/vygr-1/a2mods)



It's just for comparison here, and my own learning.
a2-325, a2-327, a2-331, those are crazy.  
They are in another repo.

Update: only one crazy branch is left: **a2-327** in **a2mods** repo. 

This Git and GitHub things are also crazy.  
I mean it's crazy to me, I often get lost. 
So many things to learn. 

GitHub Desktop, git GUI, GitKraken, PuppyGit  ...

PuppyGit on android is fun, i love it. 
And I prefer GitKraken when on my laptop. 
I accidentally created a new brach
instead of doing a push to the exixting branch.

Created a new repo instead of a push to an exixting branch. 
What a mess. What a headache. What a LoL !

This GK-a2mods, it's me fooling around with GitKraken on my laptop. 



.   
.   
.   


Edit README--gk-137.md  
---

   

OK, let's get it going...   

This specific branch is anduril2 with some mods.  


Heavy mods, maybe.   
But it has the same file structure as   
The OG [ToyKeeper Anduril2](https://github.com/ToyKeeper/anduril). 

.   
.   
.   

2025-02-22 05:59

accessing through Git GUI on Desktop


.   
.   
.   

# Mods, Custom Features, etc. 


New Files  
---


There are two new files, these are for the ver-check-mode,  
custom version check mode in blinky group 
-  ui/anduril/ver-check-mode.c  
-  ui/anduril/ver-check-mode.h  

.   
. 
  
Modified Files
---


-  bin/build.sh 
-  bin/build-all.sh 
-  bin/version-string.sh 

.   

-  ui/anduril/anduril.c  

.   

More aux patterns, using SammysHP's files: 
-  ui/anduril/aux-leds.c  
-  ui/anduril/aux-leds.h  


Mod, supporting more aux patterns:  
-  ui/anduril/lockout-mode.c  
-  ui/anduril/off-mode.c  

.   

Mod, supporting VER_CHECK_MODE : 
-  ui/anduril/battcheck-mode.c 
-  ui/anduril/beacon-mode.c  
-  ui/anduril/tempcheck-mode.c  
-  ui/anduril/sos-mode.c  

.  

candle-mode with more adjustments, using starryalley's candle-mode.c: 
-  ui/anduril/candle-mode.c  

.   

BIG-DEAL button mapping:   

OFF or ON, 3C : strobe-modes  
OFF, 5C : battcheck-mode (blinky group)   
Mod files:   
-  ui/anduril/lockout-mode.c  
-  ui/anduril/off-mode.c  
-  ui/anduril/ramp-mode.c  

.   

Custom strobe-modes   
-  ui/anduril/strobe-modes.c   
-  ui/anduril/strobe-modes.h  
-  ui/anduril/strobe-modes-fsm.h  

-  ui/anduril/load-save-config.h  
-  ui/anduril/load-save-config-fsm.h   

.   

Custom version-check-mode.h 
-  ui/anduril/version-check-mode.h  

.   
.   
.   



###  This is a rough outline / plan, the actual features implementation are TBD   


# CUSTOM FEATURES   


- disable momentary mode   
- disable POVD   
- disable extra digit for the battcheck-mode:   
    4.1 Volt , not 4.18 Volt 
- disable Simple UI   
- disable SOS mode   



## ver-check-mode

 - This is a custom version-check-mode added into the blinky group.  

 - Similar to the default (OFF, 13H) **version-check-mode**.  

 - The default **version-check-mode** runs only once. This custom **ver-check-mode** runs repeatedly. 

 - 1C to turn OFF (off-mode)  
  2C to cycle the modes:  
  **battcheck-mode**  --> **temp-check-mode**  -->  **ver-check-mode**  -->  **beacon-mode**.  

 - Extra files in the **anduril** directory:  
   **ver-check-mode.c** and **ver-check-mode.h**, which are basically copies of the OG version-check-mode files, with some mods.

.   

##   Button clicks for blinky group


OFF, **5C**: activate **battcheck-mode** (OG is 3C)   

**1C**: turn off  

**2C**: rotate through blinky group:  
   - **battcheck-mode**
   - **tempcheck-mode**  
   - **ver-check-mode**  
   - **beacon-mode**   

.  
.  
.   


## Strobe group with extra strobe modes

   - bike flasher
   - party strobe
   - tatical strobe
   - police color strobe 
   - lightning mode
   - candle mode
     
   - fireworks mode (new)
   - lighthouse mode (new)
   - broken fluorescent mode (new)
  

Extra strobe modes are inspired by and copied   
from [SiteRelEnby anduril branch](https://github.com/SiteRelEnby/anduril)   
and [starryalley anduril branch](https://github.com/starryalley/anduril) 


.  
.  
.  


## strobe-modes, remap button clicks 

OFF or ON, **3C**: activate strobe-modes (OG is 3H)  

**1C**: off  
**2C**: rotate through strobe/flasher modes  
**3C**: rotate backward through strobe/flasher modes  

.  

**1H** :  
    -  party strobe faster  
    -  tactical strobe faster  
    -  biking mode brighter  
    -  broken fluorescent mode brighter  

**2H**:   
    -  party strobe faster  
    -  tactical strobe slower  
    -  biking mode dimmer  
    -  broken fluorescent dimmer  

.  

**4C**:  
    -  turning lightning mode busy factor,   
    -  or turning down firework brightness by 12,  
    -  or decrease lighthouse delay by 1 sec  

**5C**:   
    -   turning up lightning mode busy factor,   
    -   or turning up firework brightness by 12,  
    -   or increasing lighthouse delay by 1 sec  

**6C**:    
    -   reset lightning mode busy factor to default,  
    -   or reset firework brightness to default  
    -   or reset lighthouse delay to default  

.  

**7C**:  
    -   rotate through channel modes for the current strobe  


.   
.   
.   


## Extended aux patterns


- EXTENDED_INDICATOR_PATTERNS from [SammysHP Anduril  (https://github.com/SammysHP/anduril/tree/more-aux-patterns)](https://github.com/SammysHP/anduril/tree/more-aux-patterns) 


**more-aux-patterns** 

```
Add more aux LED patterns like short low intensity blinks, short high intensity blinks or no aux LEDs at all (but keep the switch LED enabled). Works for classic and RGB aux LEDs. Also fixes some edge cases of aux handling.

```



- The OG aux patterns:   
   - Off 
   - Low
   - High 
   - Blinking (fancy blinking) 

- Extended aux patterns:   
   - Off 
   - Low
   - High 
   - Blinking (fancy blinking) 
   - Low blinking 
   - High blinking 



.   
.   
.   


.   
.   
.   


.   
.   
.   


Checks checks 

2025/02/18 20:42

2025/02/19 12:23

2025/02/19 16:42

2025-02-21

2025-02-21... 

2025-02-21 022254

2025-02-21 18.03.42


Checks 

2025-02-22 07.09.28

2025-02-22 07.10.57



.   
.   
.   

