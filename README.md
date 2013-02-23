wp-backup
=========

A script to create regular backups of your wordpress.com blog.

It's a very simple (10 lines) bash script, with the only dependency of httpie. 

You can install httpie following these instructions:

https://github.com/jkbr/httpie#installation

Installation
============

Git clone this into a directory, cd to it and rename credentials.sh.bak to credentials.sh

Then just

```
./wp-backup.sh
```

And the script should create a backup in backups/username-$date.xml
