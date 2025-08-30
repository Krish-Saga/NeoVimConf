# NeoVim Windows Setup Script
Write-Host "⚡ Setting up NeoVim config for Windows..."

# Install folder
$confPath = "$env:LOCALAPPDATA\nvim"

# Clone your repo
if (Test-Path $confPath) {
    Write-Host "Removing old config..."
    Remove-Item -Recurse -Force $confPath
}
git clone https://github.com/Krish-Saga/NeoVimConf $confPath

Write-Host "✅ NeoVim config installed at $confPath"
Write-Host "Now just open nvim and wait for plugins to install!"

