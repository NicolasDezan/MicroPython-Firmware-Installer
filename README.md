# ESP32 Firmware Flashing Tool

Este repositório contém dois scripts em Batch para facilitar o processo de detecção e flash de dispositivos ESP32 com o MicroPython.

## Scripts Disponíveis

1. **ESP32_detector.bat** - Detecta automaticamente dispositivos ESP32 conectados ao computador.
2. **ESP32_firmware_installer.bat** - Apaga a memória flash de um ESP32 e grava o firmware do MicroPython.

## Como Usar

### 1. Detectando a Porta e Chip com ESP32_detector.bat

O script **ESP32_detector.bat** permite que você encontre automaticamente as portas COM onde os dispositivos ESP32 estão conectados e exibe detalhes sobre o chip, incluindo o modelo e o endereço MAC.

#### Passos:

1. **Baixe o script `ESP32_detector.bat`** e execute-o.
2. O script começará a procurar as portas seriais disponíveis.
3. Ele testará cada porta serial para verificar se é um dispositivo ESP32.
4. O script exibirá a porta COM e as informações do chip encontrado.

### Configuração da Porta COM
Após executar o **ESP32_detector.bat**, o script mostrará a porta correta onde seu dispositivo ESP32 está conectado, como no exemplo abaixo:

```
Dispositivo ESP identificado!
Porta: COM6
Chip is ESP32
MAC: 40:4c:ca:xx:xx:xx
```

Essa será a porta que você usará no próximo passo. **Certifique-se de anotar a porta COM** (por exemplo, `COM6`) para configurar no script de gravação de firmware.

### 2. Baixando o Firmware Correto

Antes de usar o script **ESP32_firmware_installer.bat**, você precisa do arquivo de firmware correto para o seu ESP32. Para isso:

1. **Baixe o firmware do MicroPython para ESP32** no site oficial ou de uma fonte confiável. O arquivo normalmente tem o nome **`ESP32_GENERIC-YYYYMMDD-vX.XX.X.bin`**.
2. **Salve o arquivo de firmware na mesma pasta onde o script `ESP32_firmware_installer.bat` está localizado.**

> **Dica**: Se você não tem o firmware, acesse o site oficial do MicroPython ou a página de lançamentos do GitHub do MicroPython para obter o firmware correto para o ESP32.

### 3. Usando o Script `ESP32_firmware_installer.bat` para Gravar o Firmware

Após detectar a porta e baixar o firmware, você pode usar o **ESP32_firmware_installer.bat** para apagar o flash do ESP32 e gravar o novo firmware.

#### Passos:

1. **Abra o arquivo `ESP32_firmware_installer.bat`** em um editor de texto (como o Notepad) e configure a **porta COM** e o **nome do arquivo do firmware**:
    - **COMPORT=COM6**: Substitua `COM6` pela porta COM que o **ESP32_detector.bat** indicou para você.
    - **FIRMWARE=ESP32_GENERIC-20241129-v1.24.1.bin**: Substitua `ESP32_GENERIC-YYYYMMDD-vX.XX.X.bin` pelo nome correto do arquivo do firmware que você baixou.

2. **Execute o script `ESP32_firmware_installer.bat`**:
    - Ele apagará a memória flash do ESP32 e gravará o firmware.
    - Caso haja algum erro, o script exibirá uma mensagem de erro e pausará para que você possa corrigir.

#### Exemplo de saída ao executar o `ESP32_firmware_installer.bat`:

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
Agora eh soh abrir o Thonny e testar :)  
=======================================
Pressione qualquer tecla para continuar...
```

---

### Dicas Importantes

- **Alteração da Porta COM**: Quando você detectar seu dispositivo com o **ESP32_detector.bat**, altere a variável `COMPORT` no **ESP32_firmware_installer.bat** para a porta correta.
- **Alteração do Arquivo Firmware**: No **ESP32_firmware_installer.bat**, altere a variável `FIRMWARE` para corresponder ao nome do arquivo de firmware que você baixou.
- **Evite Erros de Conexão**: Se o dispositivo não for detectado ou se ocorrer um erro de gravação, certifique-se de que a porta COM está correta e que o dispositivo não está em uso por outro software.

---

## Como Contribuir

- Se você encontrar algum problema ou desejar adicionar mais funcionalidades ao script, fique à vontade para abrir uma **issue** ou **pull request**.
- **Contribuições são bem-vindas!** Se você tem ideias para melhorar o script ou adicionar suporte a mais modelos de ESP, por favor, compartilhe!
