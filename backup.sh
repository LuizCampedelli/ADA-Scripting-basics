# criar a pasta do desafio
mkdir -p ~/ada_script_challenge_01
echo "Pasta criada com sucesso"

# criar as pastas de origem e destino
mkdir -p ~/ada_script_challenge_01/origem
echo "Pasta de origem criada com sucesso"
mkdir -p ~/ada_script_challenge_01/destino
echo "Pasta de destino criada com sucesso"

# definir as variaveis do meu local de origem e destino
export origem="~/ada_script_challenge_01/origem"
echo "Variável de origem definida com sucesso"
export destino="~/ada_script_challenge_01/destino"
echo "Variável de destino definida com sucesso"
LOG_FILE="~/ada_script_challenge_01/log.txt"
echo "Variável de log definida com sucesso"

# Criar arquivo de teste
echo "Este é um arquivo de teste" > "$origem/log.txt"
echo "Arquivo de teste criado com sucesso"

# Create the log file
touch $LOG_FILE
echo "Arquivo de log criado com sucesso"

# Defina a função
backup() {
    # Copia os aruivos de origem para o destino
    cp -r "$origem"/* "$destino"/

    # Log da operação de backup
    echo "$(date '+%d-%m-%Y %H:%M:%S') - Backup realizado do diretório de origem para o diretório de destino" >> $LOG_FILE
}
echo "Função de backup definida com sucesso"
# Chama a função de backup
backup
echo "Backup realizado com sucesso"
# Remove o diretório de origem
rm -rf $DIR_ORIGEM
echo "Diretório de origem removido com sucesso"

# Imprime mensagem de conclusão
echo "Backup realizado e diretório de origem apagado."
