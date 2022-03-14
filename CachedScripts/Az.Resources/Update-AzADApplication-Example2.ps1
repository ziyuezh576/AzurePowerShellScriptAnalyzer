
Get-AzADApplication -ObjectId $id | Update-AzADApplication -ReplyUrl $replyurl
