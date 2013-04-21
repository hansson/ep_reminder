#!/bin/sh
users="user1 user2 user3"
for user in ${users}
do
	exec < "/home/${user}/.myshows"
        while read show
        do
		rm /var/tmp/shows/${show}
        	wget -q -P "/var/tmp/shows/" "epguides.com/${show}"
        done
done
