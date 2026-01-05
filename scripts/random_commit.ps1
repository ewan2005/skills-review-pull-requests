Param(
    [int]$CommitsPerRun = 1,
    [string]$RepoPath = (Get-Location),
    [switch]$Push
)

Set-StrictMode -Version Latest
try {
    Push-Location -Path $RepoPath
    # Ensure repo has a branch and git is initialized
    if (-not (Test-Path -Path ".git")) {
        Write-Error "No git repository found at $RepoPath"
        exit 1
    }

    for ($i = 0; $i -lt $CommitsPerRun; $i++) {
        $rand = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 8 | ForEach-Object {[char]$_})
        $ts = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        $file = ".autocommit_log"
        Add-Content -Path $file -Value "$ts - autocommit - $rand"

        # Stage and commit quietly
        git add $file
        $msg = "Auto commit: $ts $rand"
        git commit -m $msg 2>$null | Out-Null

        if ($Push) {
            git push 2>$null | Out-Null
        }

        Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum 6)
    }
} catch {
    Write-Error "Autocommit failed: $_"
} finally {
    Pop-Location
}
