# RAIDS
Disk RAIDS circumvent certian aspects of single disk uses. In all cases they improve reading performance, writing performance differs.

## Raid 0
Improves single disk performance through striping. IO operations are spread accross multiple disks.

:heavy_plus_sign: blazing fast writing

:heavy_minus_sign: no fault tolerance what-so-ever. Single disk failure permanently brings down the whole array!

## Overview
RAID Level | Fault Tolerance | Read Performance | Write Performance | Cost-Efficency
-----------|-----------------|------------------|-------------------|---------------
0 | None | Good | Optimal | Optimal
1 | Good | Good | Good | Decent
5 | Decent | Good | Low | Good
6 | Better than 5 | Good | Lower than 5 | Better than 5
1+0 | Excellent | Optimal | Optimal | Low
DP | Good | Good | Bad | Good
