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