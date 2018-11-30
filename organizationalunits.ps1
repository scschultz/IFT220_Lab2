#Changes made to the code "DC=ad,DC=sparky-tech,DC=com" to "DC=ad,DC=scschult,DC=lan"
# brutforce script to make some organizational units

# you need to change "DC=ad,DC=sparky-tech,DC=com" to match your domain and update the ST initials to match or remove them

Write-Host -ForegroundColor yellow "Creating OUs"
New-ADOrganizationalUnit -Name SL_Computers -Path "DC=ad,DC=scschult" -Description "SL_Computers"
New-ADOrganizationalUnit -Name Workstations -Path "OU=SL_Computers,DC=ad,DC=scschult"
New-ADOrganizationalUnit -Name President -Path "OU=Workstations,OU=SL_Computers,DC=ad,DC=scschult"
New-ADOrganizationalUnit -Name Finance -Path "OU=Workstations,OU=SL_Computers,DC=ad,DC=scschult"
New-ADOrganizationalUnit -Name HR -Path "OU=Workstations,OU=SL_Computers,DC=ad,DC=scschult"
New-ADOrganizationalUnit -Name Sales -Path "OU=Workstations,OU=SL_Computers,DC=ad,DC=scschult"
New-ADOrganizationalUnit -Name Legal -Path "OU=Workstations,OU=SL_Computers,DC=ad,DC=scschult"
New-ADOrganizationalUnit -Name IT -Path "OU=Workstations,OU=SL_Computers,DC=ad,DC=scschult"
New-ADOrganizationalUnit -Name Servers -Path "OU=SL_Computers,DC=ad,DC=scschult"
New-ADOrganizationalUnit -Name Hyper-V -Path "OU=Servers,OU=SL_Computers,DC=ad,DC=scschult"
New-ADOrganizationalUnit -Name Exchange -Path "OU=Servers,OU=SL_Computers,DC=ad,DC=scschult"
New-ADOrganizationalUnit -Name SL_Groups -Path "DC=ad,DC=scschult" -Description "High Level Security Groups"
New-ADOrganizationalUnit -Name SL_Privileged_Accounts -Path "DC=ad,DC=scschult,DC=lan" -Description "Privileged Accounts"
New-ADOrganizationalUnit -Name SL_Users -Path "DC=ad,DC=scschult" -Description "Non-Privileged Accounts"
Write-Host -ForegroundColor yellow "Done creating OUs"
Write-Host -ForegroundColor yellow ""

Write-Host -ForegroundColor yellow "Creating groups based on department"
New-ADGroup -GroupCategory Security -GroupScope Global -Name President -Path "OU=SL_Groups,DC=ad,DC=scschult"
New-ADGroup -GroupCategory Security -GroupScope Global -Name Finance -Path "OU=SL_Groups,DC=ad,DC=scschult"
New-ADGroup -GroupCategory Security -GroupScope Global -Name HR -Path "OU=SL_Groups,DC=ad,DC=scschult"
New-ADGroup -GroupCategory Security -GroupScope Global -Name Sales -Path "OU=SL_Groups,DC=ad,DC=scschult"
New-ADGroup -GroupCategory Security -GroupScope Global -Name Legal -Path "OU=SL_Groups,DC=ad,DC=scschult"
New-ADGroup -GroupCategory Security -GroupScope Global -Name IT -Path "OU=SL_Groups,DC=ad,DC=scschult"

# Create a Leadership group for the President and VPs to access restricted a file share
New-ADGroup -GroupCategory Security -GroupScope Global -Name Leadership -Path "OU=SL_Groups,DC=ad,DC=scschult"
Write-Host -ForegroundColor yellow "Done creating groups"
Write-Host -ForegroundColor yellow ""
