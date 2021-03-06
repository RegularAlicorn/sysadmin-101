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
* still good sequential writing performance

:heavy_minus_sign: 
* parity is an expensive operation for random writing operations

## RAID-6
Variant of RAID-5 resisting 2 concurrent disk failures. Writes each parity block twice thus increases overhead and write penalty respective to RAID-5.
Increases fault resistance considerably, especially interesting for larger storage sizes.

## RAID-1+0 / RAID-10
Combines RAID-1 and RAID-0 by combining multiple mirroring RAID-1 pairs into a single RAID-0. This combination offers optimal writing speed through RAID-0 while maintaining single disk faults (for each pair!). Writing is much faster than RAID-5 due to the fact that there is no parity data involved.

:heavy_plus_sign: 
* very fast writing speed
* fast reading speed
* single disk fault tolerance per pair (up to half of total disks in use)

:heavy_minus_sign: 
* halfes disk space available (mirror disks)
* perfect writing speed takes a hit from mirroring task

## Overview
RAID Level | Fault Tolerance | Read Performance | Write Performance | Cost-Efficency | Minimum amount of disks       (fault tolerance in disks)
-----------|-----------------|------------------|-------------------|----------------|------------------------
0 | None | Good | Optimal | Optimal | 2  (0)
1 | Good | Good | Good | Decent | 2 (1)
5 | Decent | Good | Low | Good | 3 (1)
6 | Excellent | Good | Lower than 5 | Worse than 5 | 4 (2)
1+0 | Excellent | Optimal | Optimal | Low | 4 (up to 2)

## Fileserver Storage
Dependant on speed, size and fault tolerance requirements, you need to analyze and decide what you need. Typically for "normal" sizes (far below petabyte size) either **RAID-5/RAID-6** for fault tolerance or **RAID-50/RAID-60** for fault tolerance with increased random writing speed is sufficent. RAID-6 replaces RAID-5 for higher data loss prevention at a higher cost.

## SQL Storage
A typical SQL storage recommendation

SQL | RAID-Level
----|-----------
OS/Binaries | RAID-1 or RAID-5 for fault tolerance
Data/Indices | RAID-1+0 (RAID-5 for budget reasons)
Logs | RAID-1+0
TempDB | Raid-1+0
Backups | RAID-5
