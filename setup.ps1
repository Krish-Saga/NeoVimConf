# setup.ps1 - Auto install & setup NeoVimConf
# Run this in PowerShell (as Administrator)

Write-Host "🚀 Starting NeoVimConf Setup..." -ForegroundColor Cyan

# Helper function to check if command exists
function Test-Command($cmd) {
    $exists = Get-Command $cmd -ErrorAction SilentlyContinue
    return $exists -ne $null
}

# 1. Install Chocolatey (if not installed)
if (!(Test-Command choco)) {
    Write-Host "🍫 Chocolatey not found. Installing..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    Write-Host "✅ Chocolatey already installed."
}

# 2. Install Git
if (!(Test-Command git)) {
    Write-Host "📥 Installing Git..."
    choco install git -y
} else {
    Write-Host "✅ Git already installed."
}

# 3. Install Neovim
if (!(Test-Command nvim)) {
    Write-Host "📥 Installing Neovim..."
    choco install neovim -y
} else {
    Write-Host "✅ Neovim already installed."
}

# 4. Install Node.js (needed for LSP, plugins, etc.)
if (!(Test-Command node)) {
    Write-Host "📥 Installing Node.js..."
    choco install nodejs -y
} else {
    Write-Host "✅ Node.js already installed."
}

# 5. Install Python (for Python LSP support)
if (!(Test-Command python)) {
    Write-Host "📥 Installing Python..."
    choco install python -y
} else {
    Write-Host "✅ Python already installed."
}

# 6. Install Ripgrep (for Telescope)
if (!(Test-Command rg)) {
    Write-Host "📥 Installing Ripgrep..."
    choco install ripgrep -y
} else {
    Write-Host "✅ Ripgrep already installed."
}

# 7. Clone your Neovim config
$ConfigPath = "$env:LOCALAPPDATA\nvim"
if (!(Test-Path $ConfigPath)) {
    Write-Host "📥 Cloning NeoVimConf repo..."
    git clone https://github.com/Krish-Saga/NeoVimConf.git $ConfigPath
} else {
    Write-Host "✅ Neovim config already exists at $ConfigPath"
}

Write-Host "🎉 Setup Complete! Launch Neovim with: nvim" -ForegroundColor Green

