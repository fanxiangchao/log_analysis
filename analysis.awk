BEGIN{
    total=0;
    column_id="Name";
    column_cost_time="Cost Time (ms)";
    column_percent="Percent (%)";
}
{
    recordArr[$1] += $2;
    total += $2;
}
END{
    printf("%-30s%30s%20s\n",column_id,column_cost_time,column_percent);
    for (i in recordArr)
    {
        printf("%-30s%30d%20.2f%%\n",i,recordArr[i],recordArr[i]*100/total);
    }
}