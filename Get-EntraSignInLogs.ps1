<#
.SYNOPSIS
    Retrieves Microsoft Entra ID (Azure AD) sign-in logs using Microsoft Graph PowerShell SDK.

.DESCRIPTION
    This script connects to Microsoft Graph and fetches user sign-in logs with filtering options.
    Results can be exported to CSV for further analysis.

.NOTES
    Author  : Mohammed Siddiqui 
    GitHub  : https://github.com/mohammedsiddiqui6872/Entra-Signin-logs
    Date    : 2025-05-11
    Version : 1.0
#>

function Get-EntraSignInLogs {
    [CmdletBinding()]
    param (
        [string]$UserPrincipalName,
        [datetime]$StartDate = (Get-Date).AddDays(-7),
        [datetime]$EndDate = (Get-Date)
    )

    try {
        Write-Host "Connecting to Microsoft Graph..." -ForegroundColor Cyan
        Connect-MgGraph -Scopes "AuditLog.Read.All" -ErrorAction Stop

        Write-Host "Fetching sign-in logs..." -ForegroundColor Cyan
        $logs = Get-MgAuditLogSignIn -Filter "createdDateTime ge $($StartDate.ToString('o')) and createdDateTime le $($EndDate.ToString('o'))" -All

        if ($UserPrincipalName) {
            $logs = $logs | Where-Object { $_.UserPrincipalName -eq $UserPrincipalName }
        }

        $logs | Select-Object UserPrincipalName, AppDisplayName, IPAddress, Status, CreatedDateTime | Export-Csv -Path "EntraSignInLogs.csv" -NoTypeInformation
        Write-Host "Logs exported to EntraSignInLogs.csv" -ForegroundColor Green
    } catch {
        Write-Error "An error occurred: $_"
    }
}

# Run the function
Get-EntraSignInLogs
