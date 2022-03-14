
New-AzNotificationHubKey -ResourceGroup "ContosoNotificationsGroup" -Namespace "ContosoNamespace" -NotificationHub "ContosoInternalHub" -AuthorizationRule "DefaultListenSharedAccessSignature" -PolicyKey "PrimaryKey"
