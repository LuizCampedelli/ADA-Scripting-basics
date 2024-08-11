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

# Definir uma lista de frases Lorem Ipsum
LOREM_IPSUM=(
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
)

# Função para obter uma frase Lorem Ipsum aleatória
get_random_lorem_ipsum() {
    local RANDOM_INDEX=$((RANDOM % ${#LOREM_IPSUM[@]}))
    echo "${LOREM_IPSUM[$RANDOM_INDEX]}"
}

# Definir a função de backup
backup() {
    # Copia os arquivos de origem para o destino
    cp -r "$ORIGEM"/* "$DESTINO"/

    # Log da operação de backup com Lorem Ipsum aleatório
    local LOREM_TEXT=$(get_random_lorem_ipsum)
    echo "$(date '+%d-%m-%Y %H:%M:%S') - Backup realizado do diretório de origem para o diretório de destino. $LOREM_TEXT" >> "$LOG_FILE"
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
