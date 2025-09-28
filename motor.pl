% -----------------------------------------------
% MOTOR DE INFERENCIA
% -----------------------------------------------

:- dynamic(resposta/2).
:- [base_conhecimento].

% calcular pontuacao de uma trilha
calcula_pontuacao(Trilha, Caracteristicas, Score) :-
    findall(Peso,
        (perfil(Trilha, Carac, Peso),
         member(Carac, Caracteristicas)),
        ListaPesos),
    sum_list(ListaPesos, Score).

% recomenda(Resultado): gera trilhas recomendadas com base nas respostas
recomenda(Resultado) :-
    findall(Carac, resposta(Carac, s), Caracteristicas),
    findall(Score-Trilha,
        (trilha(Trilha, _), calcula_pontuacao(Trilha, Caracteristicas, Score)),
        Pares),
    sort(0, @>=, Pares, Resultado).
