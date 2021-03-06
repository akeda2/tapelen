#!/bin/bash
#Tool for calculating recording-/playback-time using various tape-speeds.
#By akeda2

#Operands: [tape-length] [feet/meters]
#Syntax: tapelen(.sh) 300 meters (or feet)
#$1 is length of tape.
#$2 is unit "m*" or "f*".

#Speed-constant: 19,05cm/s is normal high-speed.
sp=19.05
#Higher speeds
h4sp=$(bc <<< "scale=1;($sp*4)/1")
h2sp=$(bc <<< "scale=1;($sp*2)/1")
#Lower speeds
Sp2=$(bc <<< "scale=2;($sp/2)/1")
Sp4=$(bc <<< "scale=2;($sp/4)/1")
Sp8=$(bc <<< "scale=3;($sp/8)/1")
spMeter=$(bc <<< "scale=4;$sp/100")

function convertsecs () {
	((h=${1}/3600))
	((m=(${1}%3600)/60))
	((s=($(bc <<< "scale=0;${1}%60"))))
	printf "%02d:%02d:%02d\n" $h $m $s
}
function speedsChart () {
 	printf "\n    %bcm ~ 30\"    | %bcm ~ 15\"    | %bcm ~ 7-1/2\"\n    %bcm ~ 3-3/4\" | %bcm ~ 1-7/8\" | %bcm ~ 15/16\"\n" $h4sp $h2sp $sp $Sp2 $Sp4 $Sp8
 }
function calcLen () {
	printf "\nRecording-time for %b m, or %b ft (6.35mm or 1/4\"-wide) audiotape:\n\n hh:mm:ss  @ speed  x * number of turns. Ex: stereo 4-track is 2x.\n\n" $1 $(roundup $(m2ft $1))
	myLen=$(bc <<< "scale=0;$1/$spMeter")
	printf " %b  @ %bcm/s  x1\n" 							$(convertsecs $myLen/4) $h4sp
	printf " %b  @ %bcm/s  x1\n" 							$(convertsecs $myLen/2) $h2sp
	printf " %b  @ %bcm/s x1\n" 							$(convertsecs $myLen) $sp
	printf " %b  @ %bcm/s x2 || @ %bcm/s x1\n" 					$(convertsecs $myLen*2) $sp $Sp2
	printf " %b  @ %bcm/s x4 || @ %bcm/s x2 || @ %bcm/s x1\n" 			$(convertsecs $myLen*4) $sp $Sp2 $Sp4
	printf " %b                    @ %bcm/s x4 || @ %bcm/s x2 || @ %bcm/s x1\n" 	$(convertsecs $myLen*8) $Sp2 $Sp4 $Sp8
	printf " %b                                     @ %bcm/s x4 || @ %bcm/s x2\n" 	$(convertsecs $myLen*16) $Sp4 $Sp8
	printf " %b                                                   || @ %bcm/s x4\n" $(convertsecs $myLen*32) $Sp8
	printf "\n"
}

function roundup () {
	echo $(bc <<< "($1+0.5)/1")
	}
function m2ft () {
	echo $(bc <<< "scale=0;($1*3.2727)/1")
	}
function ft2m () {
	echo $(bc <<< "scale=0;($1/3.2727)/1")
	}
function showhelp () {
	
	printf "\nTapelen:\tTool for calculating recording-/playback-time using various tape-speeds.\n\t\tBy David Åkesson/akeda 2015-\n"
	printf "\n\t\tOperands:\t[tape-length] [feet/meters]\n"
	printf "\t\tSwitches:\t-? (this) help\n"
	printf "\t\tSyntax:\t\ttapelen(.sh) 300 meters (or feet)\n"
	printf '\t\t\t\t($1 is length of tape. $2 is unit "m*" or "f*").\n'
	printf "\t\tExample: 	tapelen 275 m\n\n"
}
case $1 in
	-?)
		showhelp
		;;
esac
case $2 in
	m*)
		speedsChart
		calcLen $1
		;;
	f*)
		speedsChart
		calcLen $(ft2m $1)
		;;
esac
