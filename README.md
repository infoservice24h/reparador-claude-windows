# 🛠️ Reparador do Claude Desktop (Windows)

Script de código aberto para corrigir o erro de conexão (**HTTP 403 Forbidden**) e o sequestro de endpoint no aplicativo oficial do Claude Desktop para Windows.

Ferramenta desenvolvida e mantida por **iNFO SERVICE 24h**.

## ⚠️ O Problema (api Gateway)
Alguns ativadores e scripts de terceiros modificam silenciosamente o Registro do Windows, injetando Políticas Corporativas (Group Policy) que forçam o Claude a redirecionar suas chamadas da API oficial da Anthropic para gateways de terceiros (como `api.kpalabz.com`).
Mesmo reinstalando o aplicativo, o problema persiste devido ao cache local (arquivos `scope_v3.json`).

## 🚀 Como resolver em 1 clique
Este script realiza uma limpeza profunda das políticas do Registro e aplica um *Hard Reset* nos dados locais do contêiner MSIX da aplicação.

1. Pressione a tecla **Windows**, digite **PowerShell**, clique com o botão direito e escolha **Executar como Administrador**.
2. Copie o comando abaixo, cole na tela do PowerShell e pressione **Enter**:

```powershell
irm https://raw.githubusercontent.com/infoservice24h/reparador-claude-windows/refs/heads/main/reparador.ps1 | iex
