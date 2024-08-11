#!/bin/bash

# Obter o diretório atual
BASE_DIR=$(pwd)/ada_script_challenge_02

# Criar as pastas de origem e destino
mkdir -p "$BASE_DIR/origem"
echo "Pasta de origem criada com sucesso"
mkdir -p "$BASE_DIR/destino"
echo "Pasta de destino criada com sucesso"

# Definir as variáveis do meu local de origem e destino
ORIGEM="$BASE_DIR/origem"
echo "Variável de origem definida com sucesso"
DESTINO="$BASE_DIR/destino"
echo "Variável de destino definida com sucesso"
LOG_FILE="$BASE_DIR/log.txt"
echo "Variável de log definida com sucesso"

# Criar arquivos de teste
touch "$ORIGEM/arquivo1.txt" "$ORIGEM/arquivo2.txt" "$ORIGEM/arquivo3.txt"
echo "Arquivos de teste criados com sucesso"

# Criar o arquivo de log
touch "$LOG_FILE"
echo "Arquivo de log criado com sucesso"

# Definir a função de backup
backup() {
    # Copia os arquivos de origem para o destino
    cp -r "$ORIGEM"/* "$DESTINO"/

    # Log da operação de backup
    echo "$(date '+%d-%m-%Y %H:%M:%S') - Backup realizado do diretório de origem para o diretório de destino" >> "$LOG_FILE"
}
echo "Função de backup definida com sucesso"

# Chamar a função de backup
backup
echo "Backup realizado com sucesso"

# Criar backup compactado dos arquivos da pasta de origem
tar -czf "$DESTINO/backup_origem.tar.gz" -C "$ORIGEM" .
echo "Backup compactado criado com sucesso"

# Remover o diretório de origem
rm -rf "$ORIGEM"
echo "Diretório de origem removido com sucesso"

# Imprimir mensagem de conclusão
echo "Backup realizado e diretório de origem apagado."
