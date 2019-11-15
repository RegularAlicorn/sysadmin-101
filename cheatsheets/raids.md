# RAIDs
Disk RAIDs circumvent certian aspects of single disk uses. In all cases they improve reading performance, writing performance differs.

## RAID-0
Improves single disk performance through striping. IO operations are spread accross multiple disks.

:heavy_plus_sign: 
* blazing fast writing
* no overhead space lost (10 Disks à 100 GB => ~1TB RAID-0 useable space)

:heavy_minus_sign: 
* no fault tolerance what-so-ever. Single disk failure permanently brings down the whole array!

## RAID-1
Improves fault tolerance by dublicating each disk onto a mirror disk. If one fails the other fully takes it place.

:heavy_plus_sign: 
* tolerates single disk failure
* increases reading performance, controller can ask 2 disks for the same data simultaneously

:heavy_minus_sign: 
* halfes usable space
* writing penalty, each write has to be done twice

## RAID-5
Uses striping like RAID-0 with parity fault tolerance. Parity is used to recover lost data of a faulty disk within the array.

:heavy_plus_sign: 
* tolerates single disk failure
* parity uses less space than mirroring

:heavy_minus_sign: 
* parity is an expensive operation for writing operations (~4 times higher)

## RAID-1+0 / RAID-10
Combines RAID-1 and RAID-0 by combining multiple mirroring pairs into a RAID-0. This combination offers optimal writing speed through RAID-0 while maintaining single disk faults (for each pair!). Writing is much faster than RAID-5 due to the fact that there is no parity data involved.

:heavy_plus_sign: 
* very fast writing speed
* fast reading speed
* single disk fault tolerance per pair (up to half of total disks in use)

:heavy_minus_sign: 
* halfes disk space available (mirror disks)
* perfect writing speed takes a hit from mirroring task

## Overview
RAID Level | Fault Tolerance | Read Performance | Write Performance | Cost-Efficency
-----------|-----------------|------------------|-------------------|---------------
0 | None | Good | Optimal | Optimal
1 | Good | Good | Good | Decent
5 | Decent | Good | Low | Good
6 | Better than 5 | Good | Lower than 5 | Better than 5
1+0 | Excellent | Optimal | Optimal | Low
DP | Good | Good | Bad | Good
