ep_reminder
===========

Reminder of when your favorite tv show episodes are aired in the US.

USAGE
===========
Put ep_update.sh in a cronjob and change the users variable to the users that
you want to update episodes for. The script will then download the next date
that your episode is released on.

Put ep_reminder.sh in a directroy where it is runable for your users. Either a
shared one or copy the file to the different home directorys and make it run on every log in by for example putting "~/ep_reminder.sh" at the end of your 
.profile file.

In your home directory make a .myshows file that take the name part of the url
at http://epguides.com. Example file provided
