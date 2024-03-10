# Guia do Usuário - Serviço de Atendimento Telefônico Quantum Finance


## Introdução

Bem-vindo ao serviço de atendimento telefônico da Quantum Finance. Este guia fornecerá informações sobre as bibliotecas usadas e explicará como usar o arquivo fornecido.

## Equipe

- Luciano Stegun - 310526
- Emerson Faria de Oliveira - 350565
- Caio Uno - 349639

## Dependências

Certifique-se de ter as seguintes bibliotecas instaladas antes de executar o código:

```bash

pip install gtts SpeechRecognition pydub

```

# Considerações iniciais

O código utiliza a biblioteca gTTS (Google Text-to-Speech) para converter texto em fala.

As opções de áudio para saudação e interações foram pré-configuradas e salvas em arquivos MP3 para serem utilizadas no momento da execução final.

# Como Usar  

Execute o notebook Jupyter.
O serviço começará com uma saudação. Escute e aguarde.

Após a saudação, o sistema apresentará as opções. Fale claramente a sua escolha.
O sistema tentará identificar sua opção e reproduzirá uma resposta correspondente.

# Funções Principais

1. record_user_input()
Função para capturar o áudio do usuário.  

2. analyse_input(input)
Função para analisar o áudio do usuário e converter para texto.

3. identify_option(input_text, options, threshold=0.5)
Função para identificar a opção selecionada com base no texto.

4. quantum_finance_phone_service()
Função principal para iniciar o serviço de atendimento telefônico.

## Exemplo de Uso
  

Após a saudação, o usuário pode escolher entre opções pré-determinadas dizendo a opção desejada.
O sistema identificará a opção e fornecerá uma resposta correspondente.


### Notas

Certifique-se de ter um ambiente de execução adequado, incluindo um microfone funcional.

Caso nenhuma opção seja identificada após várias tentativas, o sistema encerrará o atendimento.

Divirta-se utilizando o serviço de atendimento telefônico Quantum Finance!
