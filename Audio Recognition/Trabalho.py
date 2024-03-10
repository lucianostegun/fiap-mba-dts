# %% [markdown]
# # Trabalho Audio Recognition Quantum Finance
# ## FIAP - 7DTS
# ### Integrantes
# - Luciano Stegun - 310526
# - Emerson Faria de Oliveira - 350565
# - Caio Uno - 349639

# %% [markdown]
# ### Função para capturar o áudio do usuário

# %%
import speech_recognition as SpeechRec

MICROPHONE_INDEX = 2
recognizer = SpeechRec.Recognizer()

def record_user_input():
  with SpeechRec.Microphone(MICROPHONE_INDEX) as inputDevice:
        print("Inicie a fala para captura do áudio")
        recognizer.adjust_for_ambient_noise(inputDevice,duration=1)
        resp = recognizer.listen(inputDevice)
        return resp

# %% [markdown]
# ## Função personalizada de execução de áudio
  
# %%
import os
import shutil
import platform

def play_audio(file_name):

  current_os = platform.system()
  command = None

  if current_os == "Windows":
      command = f"start"
  elif current_os == "Linux":
      command = f"aplay"
  elif current_os == "Darwin":
      command = f"afplay"

  if command != "" and shutil.which(command) is not None:
    os.system(f"{command} {file_name}")
  else:
    display(Audio(filename=file_name, autoplay=True))

# %% [markdown]
# ### Função para analizar o áudio do usuário e converter para texto

# %%
def analyse_input(input):
  try:
    return recognizer.recognize_google(input, language="pt-br")
  except SpeechRec.UnknownValueError:
      return "Google Speech Recognition could not understand audio"
  except SpeechRec.RequestError as e:
      return "Could not request results from Google Speech Recognition service; {0}".format(e)

# %% [markdown]
# ### Função para identificação da opção selecionada

# %%
import difflib

def identify_option(input_text, options, threshold=0.5):
    """
    Identifica a opção mais provável com base no texto de entrada.

    Parâmetros:
    - input_text: O texto de entrada a ser comparado.
    - options: Uma lista de opções para comparação
    - threshold: Limiar de similaridade para considerar uma correspondência.

    Retorna:
    - A opção mais provável ou False se nenhuma opção atender ao limiar.
    """
    best_match = None
    best_score = 0

    for option in options:
        score = difflib.SequenceMatcher(None, input_text.lower(), option['text'].lower()).ratio()

        if score > best_score:
            best_score = score
            best_match = option['option']

    if best_score >= threshold:
        return best_match
    else:
        return 0

# %%

# %% [markdown]
# ### Função principal de início do serviço

# %%
from IPython.display import Audio, display

options = [
  {"text": "Consulta ao saldo da conta", "option": 1},
  {"text": "Simulação de compra internacional", "option": 2},
  {"text": "Falar com um atendente", "option": 3},
  {"text": "Sair do atendimento", "option": 4},
  {"text": "Encerrar atendimento", "option": 4},
  {"text": "Sair", "option": 4},
  {"text": "Opção 1", "option": 1},
  {"text": "Opção 2", "option": 2},
  {"text": "Opção 3", "option": 3},
  {"text": "Opção 4", "option": 4},
  {"text": "Um", "option": 1},
  {"text": "Dois", "option": 2},
  {"text": "Três", "option": 3},
  {"text": "Quatro", "option": 4},
  {"text": "1", "option": 1},
  {"text": "2", "option": 2},
  {"text": "3", "option": 3},
  {"text": "4", "option": 4}
]

def quantum_finance_phone_service():
  MAX_ATTEMPTS = 3
  attempts = 0;

  print("Tocando saudação inicial")
  play_audio("audios/saudacao.mp3")

  while attempts < MAX_ATTEMPTS:
    attempts = attempts + 1
    print("Tocando as opções do menu")
    play_audio("audios/opcoes.mp3")

    input = record_user_input()
    speech_to_text = analyse_input(input)
    print(f"Fala do usuário: {speech_to_text}")

    option = identify_option(speech_to_text, options);
    print(f"Opção identificada: {option}")   

    if option > 0:
      audio_file = f"audios/opcao-{option}.mp3"
      print(f"Reproduzindo {audio_file}")

      play_audio(audio_file)
      break;
    else:
      play_audio("audios/nao-identificado.mp3")

      if attempts >= MAX_ATTEMPTS:
        play_audio("audios/finalizando-atendimento.mp3")
        break
      else:
        print("Reiniciando loop a partir das opções do menu")
    
  print("Encerrando o serviço")

quantum_finance_phone_service()

