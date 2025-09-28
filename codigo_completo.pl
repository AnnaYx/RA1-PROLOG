% -----------------------------------------------
% SISTEMA ESPECIALISTA - ESCOLHA DE TRILHA
% -----------------------------------------------

%predicado dinâmico(resposta tem 2 argumentos que podem ser modificados)
:- dynamic(resposta/2).

% BASE DE CONHECIMENTO ##### 
% trilhas disponíveis com descricão
trilha(inteligencia_artificial, 'Algoritmos e modelos para reconhecer padroes e tomar decisoes.').
trilha(desenvolvimento_web, 'Criacao de aplicacoes web (front e back-end).').
trilha(seguranca, 'Protecao de sistemas e defesa cibernetica.').
trilha(ciencia_dados, 'Analise e interpretacao de grandes volumes de dados.').
trilha(redes, 'Administracao de redes e infraestrutura de TI.').

% perfis com características e pesos (quanto cada característica é importante para cada trilha)
perfil(inteligencia_artificial, matematica, 5).
perfil(inteligencia_artificial, logica, 4).
perfil(inteligencia_artificial, ia, 5).
perfil(desenvolvimento_web, design, 4).
perfil(desenvolvimento_web, frontend, 4).
perfil(desenvolvimento_web, backend, 4).
perfil(seguranca, criptografia, 5).
perfil(seguranca, redes, 4).
perfil(seguranca, investigacao, 4).
perfil(ciencia_dados, matematica, 5).
perfil(ciencia_dados, programacao, 4).
perfil(ciencia_dados, dados, 5).
perfil(redes, redes, 5).
perfil(redes, administracao, 4).
perfil(redes, problemas, 4).

% perguntas feitas para o usuário associadas a características
pergunta(1, 'Voce gosta de matematica e estatistica?', matematica).
pergunta(2, 'Voce gosta de logica e algoritmos?', logica).
pergunta(3, 'Tem interesse em Inteligencia Artificial?', ia).
pergunta(4, 'Gosta de design e interfaces?', design).
pergunta(5, 'Prefere trabalhar com frontend?', frontend).
pergunta(6, 'Prefere trabalhar com backend?', backend).
pergunta(7, 'Gosta de criptografia e seguranca?', criptografia).
pergunta(8, 'Tem afinidade com redes de computadores?', redes).
pergunta(9, 'Gosta de investigar e resolver ataques?', investigacao).
pergunta(10, 'Gosta de programar e analisar dados?', programacao).
pergunta(11, 'Tem interesse em explorar grandes volumes de dados?', dados).
pergunta(12, 'Tem interesse em administrar servidores/sistemas?', administracao).
pergunta(13, 'Consegue resolver problemas tecnicos rapidamente?', problemas).

% MOTOR DE INFERÊNCIA #####
% calcula a pontuação de uma trilha com base nas características respondidas
calcula_pontuacao(Trilha, Caracteristicas, Score) :-
    % busca os pesos das características da trilha escolhida
    findall(Peso,
        (perfil(Trilha, Carac, Peso),
         member(Carac, Caracteristicas)),
        ListaPesos),
    % soma todos os pesos para gerar a pontuação final
    sum_list(ListaPesos, Score).

% recomenda trilhas de acordo com a pontuação do usuário
recomenda(Resultado) :-
    % pega todas as características respondidas como "sim"
    findall(Carac, resposta(Carac, s), Caracteristicas),
    % calcula pontuação de cada trilha
    findall(Score-Trilha,
        (trilha(Trilha, _), calcula_pontuacao(Trilha, Caracteristicas, Score)),
        Pares),
    sort(0, @>=, Pares, Resultado).

% INTERFACE #####
iniciar :-
    % limpa tela
    retractall(resposta(_, _)),
    writeln('--- Escolha de Trilha em Tecnologia ---'),
    writeln('Digite apenas s. para sim ou n. para nao'),
    % questionário
    questionario,
    % trilhas
    recomenda(Resultado),
    % exibe resultados
    exibir(Resultado).

% faz as perguntas para o usuário
questionario :-
    forall(pergunta(_, Texto, Carac),
           perguntar(Texto, Carac)).

% faz uma pergunta (s ou n) , lê a resposta e armazena
perguntar(Texto, Carac) :-
    format('~w (s/n)~n', [Texto]),
    read(Resp),
    (   (Resp == s ; Resp == n)
    ->  assertz(resposta(Carac, Resp))  
    ;   writeln('Resposta invalida! Digite apenas s. ou n.'),
        perguntar(Texto, Carac)% repete em caso de erro         
    ).

% exibe o ranking das trilhas com suas descrições e pontuação
exibir(Resultado) :-
    writeln('\n--- Ranking de Trilhas ---'),
    forall(member(Score-Trilha, Resultado), (
        trilha(Trilha, Desc),
        format('~w -> Pontuacao: ~d~n   ~w~n', [Trilha, Score, Desc]),
        justificar(Trilha),
        nl
    )).

% justificativa
justificar(Trilha) :-
    writeln('   Justificativa:'),
    forall((perfil(Trilha, Carac, Peso), resposta(Carac, s)),
        format('    - ~w (peso ~d)~n', [Carac, Peso])).
