#to extend a single user's account expiration by 90 days- bbarnes is the username
Set-ADAccountExpiration -Identity bbarnes -TimeSpan 90.0:0

#to extend a single user's account out to a specific date- pattifu is the username
Set-ADAccountExpiration -Identity PattiFu -DateTime "03/22/2021"

#to change the manager of a single user- mflowers is user, ashowers is manager
get-aduser mflowers | Set-ADUser -Manager ashowers

#to get a list of direct reports a manager has, ashowers is manager
get-aduser ashowers -Properties DirectReports | Select -Expand DirectReports | get-aduser -Properties Title | Select Name,Title