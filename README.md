# tapelen
Simple (yes, really) written-in-bash tor for calculating total recording-/playback-time on (reel-to-reel or cassette) tape.

```
Move script to, or place a symlink somewhere useful, ex: ln -s ~/dev/tapelen/tapelen.sh /usr/local/bin/tapelen

Usage: tapelen [length] [unit]

Example:
$ tapelen 275 m 

Or use feet:
$ tapelen 900 ft

Both will give the output:

    76.2cm ~ 30"    | 38.1cm ~ 15"    | 19.05cm ~ 7-1/2"
    9.52cm ~ 3-3/4" | 4.76cm ~ 1-7/8" | 2.381cm ~ 15/16"

Recording-time for 275 m, or 899 ft (6.35mm or 1/4"-wide) audiotape:

hh:mm:ss  @ speed  x * number of turns. Ex: stereo 4-track is 2x.

00:06:00  @ 76.2cm/s  x1
00:12:01  @ 38.1cm/s  x1
00:24:03  @ 19.05cm/s x1
00:48:06  @ 19.05cm/s x2 || @ 9.52cm/s x1
01:36:12  @ 19.05cm/s x4 || @ 9.52cm/s x2 || @ 4.76cm/s x1
03:12:24                    @ 9.52cm/s x4 || @ 4.76cm/s x2 || @ 2.381cm/s x1
06:24:48                                     @ 4.76cm/s x4 || @ 2.381cm/s x2
12:49:36                                                   || @ 2.381cm/s x4
```
