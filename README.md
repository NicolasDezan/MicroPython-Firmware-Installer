# ESP32 MicroPython Firmware Installer

Este repositório contém dois scripts em Batch para facilitar o processo de detecção e gravação (flash) de dispositivos ESP32 com o MicroPython. Ele foi desenvolvido com foco na praticidade e usabilidade em ambientes Windows, especialmente para iniciantes em programação de microcontroladores.

## Scripts Disponíveis

1. **ESP32_detector.bat**  
   Detecta automaticamente dispositivos ESP32 conectados ao computador, exibindo informações do chip e MAC.

2. **ESP32_firmware_installer.bat**  
   Apaga a memória flash de um ESP32 e grava o firmware do MicroPython, a partir de um arquivo `.bin`.

---

## Como Usar os Scripts

### 1. Detectando o ESP32 com `ESP32_detector.bat`

Este script automatiza a verificação de portas COM ativas, detectando quais delas possuem dispositivos ESP32 conectados.

#### Passos:
1. **Baixe o script `ESP32_detector.bat`** e execute-o com duplo clique.
2. O script fará a verificação do Python e do `esptool`. Caso estejam ausentes, tentará instalá-los.
3. Em seguida, listará as portas COM e tentará identificar o chip conectado.
4. Se o dispositivo for encontrado, ele exibirá algo como:

```
Dispositivo ESP identificado!
Porta: COM6
Chip is ESP32-C3
MAC: 40:4c:ca:xx:xx:xx
```

Essa será a porta que você usará no próximo script.

---

### 2. Preparando o Firmware

Antes de usar o script de instalação do firmware, você precisa obter o arquivo correto `.bin`.

#### Passos:
1. Acesse o site oficial do MicroPython: https://micropython.org/download/esp32/
2. Baixe a versão compatível com seu modelo de ESP32 (como ESP32-C3 ou ESP32).
3. Salve o arquivo `.bin` na mesma pasta onde estão os dois scripts `.bat`.

---

### 3. Gravando o Firmware com `ESP32_firmware_installer.bat`

Este script apaga a memória e grava o firmware no ESP32.

#### Passos:
1. **Execute o `ESP32_firmware_installer.bat`** com duplo clique.
2. O script pedirá duas informações:
   - Porta COM (ex: `COM6`) → Use a que foi identificada no script anterior.
   - Nome do firmware (ex: `ESP32_GENERIC-20241129-v1.24.1.bin`) → Deve estar na mesma pasta que o script.

#### Exemplo de Execução:

```
========================================
        GRAVAR FIRMWARE ESP32        
========================================

Etapa 1: Apagando a memoria flash do ESP32...
(aguarde até a conclusão...)

Etapa 2: Gravando o firmware: ESP32_GENERIC-20241129-v1.24.1.bin
(aguarde até a gravação ser concluída...)

=======================================
    Firmware gravado com sucesso!      
=======================================
Pressione qualquer tecla para continuar...
```

---

## Dicas Importantes

- **Python no PATH**: Ambos os scripts requerem o Python instalado e acessível pelo terminal. Caso o Python não esteja no PATH, o script abrirá o site oficial para download.
- **Firmware na pasta correta**: O script de gravação só funcionará se o arquivo `.bin` estiver na mesma pasta.
- **Erros comuns**:
  - Porta COM errada → verifique no `ESP32_detector.bat`.
  - Falha ao instalar o esptool → tente manualmente com `pip install esptool`.
  - ESP32 não aparece → verifique drivers USB e conexão física.

---

## Como Contribuir

- Encontrou um bug? Abra uma *issue* descrevendo o problema.
- Tem uma sugestão de melhoria? Envie um *pull request*.
- Este repositório é feito para ser útil, simples e didático. Toda contribuição é bem-vinda!

