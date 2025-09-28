# Sistema Especialista para Recomendação de Trilha Acadêmica

## Descrição

Este projeto implementa um **Sistema Especialista** em **Prolog** para auxiliar estudantes de cursos de tecnologia a escolher uma **trilha de especialização** com base em suas **habilidades e interesses**.

O sistema utiliza uma **base de conhecimento**, um **motor de inferência** e uma **interface interativa**, que fazem perguntas ao usuário, calculam pontuações de compatibilidade e exibem recomendações justificadas.

---

## Objetivo

- Implementar um sistema especialista capaz de:
  - Interagir com o usuário (modo interativo);
  - Modo de teste;
  - Fazer perguntas sobre aptidões e interesses;
  - Utilizar regras de inferência para recomendar trilhas;
  - Exibir um ranking com **pontuações** e **justificativas**;
  - Ser testado automaticamente via **arquivos de perfil**.

---

## Estrutura do Projeto

```
📂 sistema-trilha-prolog
 ┣ 📜 codigo_completo        
 ┣ 📜 base_conhecimento.pl   # Fatos: trilhas, perfis e perguntas
 ┣ 📜 motor.pl               # Regras: cálculo de pontuação e recomendação
 ┣ 📜 interface.pl           # Interação com o usuário e fluxo principal
 ┣ 📜 perfil_teste_1.pl      # Perfil de teste 1 (ex: ciência de dados)
 ┣ 📜 perfil_teste_2.pl      # Perfil de teste 2 (ex: segurança)
 ┣ 📜 perfil_teste_3.pl      # Perfil de teste 3 (ex: desenvolvimento web)
 ┣ 📜 README.md              # Documentação do projeto
```

---

## Requisitos

- **SWI-Prolog** (versão mais recente)  
  [Baixar aqui](https://www.swi-prolog.org/Download.html)

Ou, se preferir, utilize o ambiente online: [SWISH Prolog](https://swish.swi-prolog.org/)

---

## Como Executar

### Modo Interativo

1. Abra o terminal e inicie o Prolog:
   ```bash
   swipl
   ```

2. Carregue os arquivos principais:
   ```prolog
   ?- consult('base_conhecimento.pl').
   ?- consult('motor.pl').
   ?- consult('interface.pl').
   ```

3. Inicie o sistema:
   ```prolog
   ?- iniciar.
   ```

4. Responda às perguntas digitando `s.` para **sim** e `n.` para **não**.

O sistema exibirá um **ranking** das trilhas recomendadas com **pontuações** e **justificativas**.

---

### Modo de Teste Automático

1. Carregue o sistema e um perfil de teste:
   ```prolog
   ?- consult('base_conhecimento.pl').
   ?- consult('motor.pl').
   ?- consult('interface.pl').
   ?- consult('perfil_teste_1.pl').
   ```

2. Execute a recomendação:
   ```prolog
   ?- recomenda(Resultado), exibir(Resultado).
   ```

3. O sistema mostrará o ranking automaticamente, sem perguntas.

---

## Estrutura Lógica

### base_conhecimento.pl
- Fatos:
  - `trilha/2` → Nome da trilha e descrição
  - `perfil/3` → Trilhas com características e pesos
  - `pergunta/3` → Perguntas para o usuário

### motor.pl
- Regras de inferência:
  - `calcula_pontuacao/3`
  - `recomenda/1`

### interface.pl
- Controle do fluxo:
  - `iniciar/0` → início da interação
  - `questionario/0` → faz as perguntas
  - `perguntar/2` → lê respostas
  - `exibir/1` → mostra o ranking final

---

## Arquivos de Teste

Os **arquivos de teste** simulam perfis de alunos e permitem execução automática:

### Perfil 1: forte inclinacao para IA


### Perfil 2: afinidade com Web


### Perfil 3: inclinacao para redes e seguranca


Esses arquivos permitem testar automaticamente o comportamento do sistema para diferentes perfis.

---

## Equipe

| Nome | Usuário GitHub |
|------|----------------|
| Victor Valerio Fadel     | GitHub: (https://github.com/VictorFadel06) |
| Anna Bosquilia Navarro   | GitHub: (https://github.com/AnnaYx) |
| Nicole Pereira Guarnieri | GitHub: (https://github.com/nick11nic) |


**Instituição:** PUCPR  
**Disciplina:** Programação Lógica e Funcional
**Professor:** Frank Coelho de Alcantara

---

