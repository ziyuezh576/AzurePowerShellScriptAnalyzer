
New-AzScheduledQueryRuleSource -DataSourceId <String> -Query 'Heartbeat | summarize AggregatedValue = count() by bin(TimeGenerated, 5m)'
