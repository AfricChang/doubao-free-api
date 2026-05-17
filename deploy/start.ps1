param(
    [int]$Port = 8000
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Doubao Free API Server" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查 node
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] Node.js not found! Please install Node.js 18+ first." -ForegroundColor Red
    exit 1
}

# 安装依赖（首次运行）
if (-not (Test-Path "node_modules")) {
    Write-Host "[INFO] Installing dependencies..." -ForegroundColor Yellow
    npm install --omit=dev
    Write-Host ""
}

Write-Host "[INFO] Starting server on port $Port..." -ForegroundColor Green
Write-Host "[INFO] Press Ctrl+C to stop." -ForegroundColor Gray
Write-Host ""

node --enable-source-maps dist/index.js --port $Port
