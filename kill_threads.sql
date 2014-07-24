#Compile sleeping threads into a file with a kill command for each mysql thread and load the file to kill threads.
select concat('KILL ',id,';') from information_schema.processlist where Command='Sleep' into outfile '/tmp/process.txt';
source /tmp/process.txt;
