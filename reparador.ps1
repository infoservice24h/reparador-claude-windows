Write-Host "Iniciando a limpeza profunda do Claude Desktop..." -ForegroundColor Cyan
Stop-Process -Name "Claude", "cowork-svc" -Force -ErrorAction SilentlyContinue

$registryPaths = @(
    "HKLM:\SOFTWARE\Policies\Claude",
    "HKLM:\SOFTWARE\WOW6432Node\Policies\Claude",
    "HKCU:\SOFTWARE\Policies\Claude",
    "HKLM:\SOFTWARE\Policies\Anthropic",
    "HKCU:\SOFTWARE\Policies\Anthropic"
)

foreach ($path in $registryPaths) {
    if (Test-Path $path) {
        Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
    }
}

$appDataPath = "$env:LOCALAPPDATA\Packages\Claude_pzs8sxrjxfjjc"
if (Test-Path $appDataPath) {
    Remove-Item -Path $appDataPath -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "===================================================" -ForegroundColor Green
Write-Host " [V] Limpeza concluída! O Claude foi restaurado." -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Ferramenta de reparo fornecida por: iNFO SERVICE 24h" -ForegroundColor Cyan
Write-Host ""

$waLink = "https://wa.me/5521997605443?text=Usei%20seu%20reparador%20Claude,%20muito%20obrigado!"

Write-Host "Conseguiu resolver o seu problema?" -ForegroundColor Yellow
$resposta = Read-Host "Deseja abrir o WhatsApp para enviar um 'Obrigado' ao criador? (S/N)"

if ($resposta -match "^[sS]") {
    Write-Host "Abrindo o WhatsApp..." -ForegroundColor Green
    Start-Process $waLink
} else {
    Write-Host "Tudo pronto! Você já pode fechar esta janela e abrir o Claude normalmente." -ForegroundColor Gray
}
Write-Host ""
