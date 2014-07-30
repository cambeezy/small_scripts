#Compile sleeping threads into a file with a kill command for each mysql thread and load the file to kill threads then delete the file.

system rm /tmp/process.sql;
select concat('KILL ',id,';') from information_schema.processlist where Command='Sleep' into outfile '/tmp/process.sql';

source /tmp/process.sql;
system rm /tmp/process.sql;
