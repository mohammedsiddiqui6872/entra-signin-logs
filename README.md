# Entra ID Sign-In Logs PowerShell Script

![PowerShell](https://img.shields.io/badge/PowerShell-7+-blue.svg)
![License](https://img.shields.io/github/license/mohammedsiddiqui6872/Entra-Signin-logs)
![Maintained](https://img.shields.io/badge/maintained-yes-brightgreen)

![Preview](./thumbnail.png)

Fetch and export Microsoft Entra ID (Azure AD) sign-in logs using Microsoft Graph PowerShell SDK.

---

## Features

- Filters logs by date range and user
- Outputs CSV file for reporting
- Uses modern Graph API authentication

---

## Prerequisites

- PowerShell 7+
- Microsoft.Graph module

### Install Graph Module

```powershell
Install-Module Microsoft.Graph -Scope CurrentUser
```

---

## Usage

```powershell
.\Get-EntraSignInLogs.ps1
```

With parameters:

```powershell
Get-EntraSignInLogs -UserPrincipalName "john.doe@domain.com" -StartDate "2025-05-01" -EndDate "2025-05-10"
```

---

## Sample Output

| UserPrincipalName    | AppDisplayName    | IPAddress    | Status  | CreatedDateTime       |
|----------------------|-------------------|--------------|---------|------------------------|
| john.doe@domain.com  | Microsoft Teams   | 192.168.1.1  | Success | 2025-05-10T12:45:00Z   |

---

## GitHub Actions (Optional)

Add the following `.github/workflows/test.yml` to run basic syntax checks:

```yaml
name: PowerShell Script Check

on: [push, pull_request]

jobs:
  syntax-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: PowerShell Lint
        uses: pwsh-actions/powershell-lint@v1
```

---

## License

MIT License. See [LICENSE](LICENSE).
