#!/bin/sh

GS=$'\035'
RS=$'\036'
currentDate=`date +%Y%m%d%H%M%S`
tmpFilterFile=$PWD'/tmp_'$currentDate'.log'

if [ $# -lt 1 -o "$1" = "--help" ];then
    echo "Usage: $0 'log file path'"
    exit 1
fi

logFile=$1

function filterLog()
{
    echo $tmpFilterFile
    sed -n '/'$GS'/p' $logFile | awk -F$GS '{print $2}' > $tmpFilterFile
}

function analysisLog()
{
    awk -F$RS -f analysis.awk $tmpFilterFile 
}

filterLog
analysisLog