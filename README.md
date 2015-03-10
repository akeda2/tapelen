# tapelen
Simple calculator for recording-time on tape. Sample output and syntax:
Usage: tapelen [lenth] [unit]
Example:$ ./tapelen 275 m

    76.2cm ~ 30"    | 38.1cm ~ 15"    | 19.05cm ~ 7-1/2"
    9.52cm ~ 3-3/4" | 4.76cm ~ 1-7/8" | 2.381cm ~ 15/16"

Recording-time for 6.35mm / 1/2" tape, length: 275 meters, or 899 feet:

 hh:mm:ss  @ speed  x * number of turns. Ex: stereo 4-track is 2x.

 00:06:00  @ 76.2cm/s  x1
 00:12:01  @ 38.1cm/s  x1
 00:24:03  @ 19.05cm/s x1
 00:48:06  @ 19.05cm/s x2 || @ 9.52cm/s x1
 01:36:12  @ 19.05cm/s x4 || @ 9.52cm/s x2 || @ 4.76cm/s x1
 03:12:24                    @ 9.52cm/s x4 || @ 4.76cm/s x2 || @ 2.381cm/s x1
 06:24:48                                     @ 4.76cm/s x4 || @ 2.381cm/s x2
 12:49:36                                                   || @ 2.381cm/s x4
