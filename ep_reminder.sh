#!/bin/sh
MONTHS="Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec"
DAYSINMONTH="Jan 31 Feb 28 Mar 31 Apr 30 May 31 Jun 30 Jul 31 Aug 31 Sep 30 Oct 31 Nov 30 Dec 31"
FOUNDSHOW="false"
#thisUser=`last | head -n 1 | awk '{print $1}'`
date=`date --date=YESTERDAY +%d%b%y`
day=`echo ${date}  | cut -c1-2`
month=`echo ${date} | cut -c3-5`
year=`echo ${date} | cut -c6-7`
echo ""
echo "NEW EPISODES"
echo "----------------"
if [ -e "/home/${USER}/.myshows" ]
then
	exec < "/home/${USER}/.myshows"
	while read show
	do
		if [ -e "/var/tmp/shows/${show}" ]
		then
			result=""
			result=`egrep "${day}/${month}/${year}" "/var/tmp/shows/${show}"`
		else
			wget -q -P "/var/tmp/shows/" "epguides.com/${show}"
			result=`egrep "${day}/${month}/${year}" "/var/tmp/shows/${show}"`
		fi
		
		if [ -z "${result}" ]
		then
			FOUNDSHOW=${FOUNDSHOW}
		else
			FOUNDSHOW="true"
			echo ${show} "- Avsnitt: "`echo ${result} | awk '{print $2}'`
		fi
	done
	if [ "${FOUNDSHOW}" = "false" ]
	then
		echo  "Inga nya avsnitt idag!"
	fi
else
	echo ".myshows not configured!"
fi
