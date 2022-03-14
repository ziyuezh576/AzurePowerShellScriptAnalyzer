
$contactDetail = new-object Microsoft.Azure.Commands.Support.Models.PSContactProfile

$contactDetail.FirstName = "first name updated"

$contactDetail.LastName = "last name updated"

Update-AzSupportTicket -Name "test1" -CustomerContactDetail $contactDetail 
