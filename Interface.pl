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