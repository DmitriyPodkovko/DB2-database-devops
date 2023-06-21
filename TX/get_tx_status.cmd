@echo off
if exist get_status.dat erase get_status.dat
date /t >>  g:\report_cbd\report_tx\get_status.log 
time /t >>  g:\report_cbd\report_tx\get_status.log

echo connect to rbd ; > get_status.dat 
echo select SUBSTR(indschema,1,10), SUBSTR(indname,1,10), SUBSTR(tabschema,1,8), SUBSTR(tabname,1,15), number_docs  from db2ext.textindexes group by tabname, indschema, indname, tabschema, number_docs order by tabname ; >> get_status.dat

db2cmd /c /w /i db2 -tvf get_status.dat >> g:\report_cbd\report_tx\get_status.log

del get_status.dat

exit