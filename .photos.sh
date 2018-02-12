picPath=${1////\\}      #Replace all / with \ in linux path
echo Opening on Windows path: $picPath
cmd.exe /C "explorer "$picPath
