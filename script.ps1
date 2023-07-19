$start = Get-Date -Year 2023 -Month 1 -Day 1 -Hour 19 -Minute 0 -Second 0	# 07:00PM
#### change -UserId with your Windows Account username
# $STPrin = New-ScheduledTaskPrincipal -UserId 'ExampleUserName' -LogonType 'Interactive' -Id 'Author' -RunLevel 'Limited'
$Sttrr = New-ScheduledTaskTrigger -Weekly -WeeksInterval 1 -DaysOfWeek Sunday -At $start
$Stset = New-ScheduledTaskSettingsSet -ExecutionTimeLimit (New-TimeSpan -Hours 2) -RunOnlyIfNetworkAvailable -DisallowDemandStart -AllowStartIfOnBatteries -StartWhenAvailable

$allTasks = Get-ScheduledTask -TaskName 'GoogleUpdateTaskMachine*' -TaskPath '\'
foreach ($task in $allTasks) {
	Set-ScheduledTask -TaskName $task.TaskName -TaskPath $task.TaskPath -Trigger $Sttrr -Settings $Stset # -Principal $STPrin

}

#### Uncomment the following lines to change MicrosoftEdgeUpdate

# $start = Get-Date -Year 2023 -Month 1 -Day 1 -Hour 19 -Minute 30 -Second 0	# 07:00PM
# $Sttrr = New-ScheduledTaskTrigger -Weekly -WeeksInterval 1 -DaysOfWeek Sunday -At $start
# $allTasks = Get-ScheduledTask -TaskName 'MicrosoftEdgeUpdateTaskMachine*' -TaskPath '\'
# foreach ($task in $allTasks) {
# 	Set-ScheduledTask -TaskName $task.TaskName -TaskPath $task.TaskPath -Trigger $Sttrr -Settings $Stset -Principal $STPrin

# }

Read-Host -Prompt 'Press Enter key to continue'
