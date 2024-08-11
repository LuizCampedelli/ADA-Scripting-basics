#!/bin/bash

# Criar as pastas de origem e destino
mkdir -p ~/ada_script_challenge_02/origem
echo "Pasta de origem criada com sucesso"
mkdir -p ~/ada_script_challenge_02/destino
echo "Pasta de destino criada com sucesso"

# Definir as variáveis do meu local de origem e destino
export ORIGEM=~/ada_script_challenge_02/origem
echo "Variável de origem definida com sucesso"
export DESTINO=~/ada_script_challenge_02/destino
echo "Variável de destino definida com sucesso"
LOG_FILE=~/ada_script_challenge_02/log.txt
echo "Variável de log definida com sucesso"

# Criar arquivos de teste
touch "$ORIGEM/arquivo1.txt" "$ORIGEM/arquivo2.txt" "$ORIGEM/arquivo3.txt"
echo "Arquivos de teste criados com sucesso"

# Criar o arquivo de log
touch $LOG_FILE
echo "Arquivo de log criado com sucesso"

# Definir a função de backup
backup() {
    # Copia os arquivos de origem para o destino
    cp -r "$ORIGEM"/* "$DESTINO"/

    # Log da operação de backup
    echo "$(date) - Backup realizado do diretório de origem para o diretório de destino" >> $LOG_FILE
}
echo "Função de backup definida com sucesso"

# Chamar a função de backup
backup
echo "Backup realizado com sucesso"

# Criar backup compactado dos arquivos da pasta de origem
tar -czf "$DESTINO/backup_origem.tar.gz" -C "$ORIGEM" .
echo "Backup compactado criado com sucesso"

# Remover o diretório de origem
rm -rf $ORIGEM
echo "Diretório de origem removido com sucesso"

# Imprimir mensagem de conclusão
echo "Backup realizado e diretório de origem apagado."