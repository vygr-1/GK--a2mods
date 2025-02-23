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

2025-02-23 

README--gk-137.md  
---

**BEWARE!**  
**THIS README IS A MESS.**


This is a secondary README file, contains info on the mods of this specific branch, gk-137.  

I was using GitKraken on my laptop, click this and that, created a local repo, created a remote repo, playing around, etc. etc.  


And created a remote repo: **GK-a2mods**.  
With a branch in it: **GK-a2-137**.  
Or was it gk-a2-137?  
I'm not sure.  
I'm kinda lost.  


On my android phone I created another branch on this remote repo. The new branch is **gk-137**.  
I use PuppyGit on my phone. 
Deleted the older branch. Blah blah blah ...

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

