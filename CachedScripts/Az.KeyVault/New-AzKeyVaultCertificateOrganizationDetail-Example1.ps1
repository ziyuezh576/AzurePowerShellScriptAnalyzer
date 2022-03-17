
$AdminDetails = New-AzKeyVaultCertificateAdministratorDetail -FirstName "Patti" -LastName "Fuller" -EmailAddress "Patti.Fuller@contoso.com" -PhoneNumber "1234567890"

New-AzKeyVaultCertificateOrganizationDetail -AdministratorDetails $AdminDetails
