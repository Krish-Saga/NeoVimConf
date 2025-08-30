# ===============================
# Krish's Auto Neovim Setup Script
# ===============================

# Function to check if a command exists
function Test-Command {
    param([string]$cmd)
    $null -ne (Get-Command $cmd -ErrorAction SilentlyContinue)
}

Write-Host "🚀 Starting Neovim Setup Script..."

# ---- 1. Install Chocolatey if missing ----
if (-not (Test-Command choco)) {
    Write-Host "🍫 Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} else {
    Write-Host "✅ Chocolatey already installed, skipping..."
}

# Refresh environment so choco is usable
refreshenv | Out-Null

# ---- 2. Install required packages ----
$packages = @("git", "neovim", "ripgrep", "fd")

foreach ($pkg in $packages) {
    if (-not (Test-Command $pkg)) {
        Write-Host "📦 Installing $pkg..."
        choco install $pkg -y
    } else {
        Write-Host "✅ $pkg already installed, skipping..."
    }
}

# ---- 3. Clone Krish's Neovim Config ----
$targetDir = "$env:LOCALAPPDATA\nvim"
if (-not (Test-Path $targetDir)) {
    Write-Host "📂 Cloning Neovim config..."
    git clone https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME.git $targetDir
} else {
    Write-Host "✅ Neovim config already exists, skipping..."
}

Write-Host "🎉 All done! Open Neovim by typing: nvim"

