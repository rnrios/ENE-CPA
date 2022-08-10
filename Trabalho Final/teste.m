%%% Rodrigo Naves Rios - 16/0144094
%%% Rede de Petri - Sistema 1

clear
close all
clc

%-------------------------------------------------------%
%Modelo da Rede

%Transições
global I
I = eye(13);
BON = I(1,:);
BOFF = I(2,:);
SON1 = I(3,:);
SON2 = I(4,:);
SOFF = I(5,:);
BM = I(6,:);
C1 = I(7,:);
C2 = I(8,:);
EM_OFF1 = I(9,:);
EM_OFF2 = I(10,:);
EM_OFF3 = I(11,:);
EM_OFF4 = I(12,:);
EM_ON = I(13,:);

%Vetor de Transições
global T 
T = [BON; BOFF; SON1; SON2; SOFF;BM; C1; C2; EM_OFF1;...
    EM_OFF2; EM_OFF3; EM_OFF4; EM_ON];

%Rotulos das Transições
global Rot
Rot = ["Bon", "Boff", "Son", "Son", "Soff","Bm", "C1", "C2",...
    "Em_off", "Em_off", "Em_off", "Em_off","Em_on"];


global A
A = [-1 1 0 1 0 0 0 0;
    1 -1 -1 0 0 0 0 0;
    0 0 1 -1 -1 -1 0 0;
    0 0 1 -1 -1 0 -1 0;
    0 0 -1 1 0 0 0 0;
    0 0 0 0 1 1 0 0;
    0 0 0 0 0 -1 1 0;
    0 0 0 0 0 1 -1 0;
    0 -1 -1 0 0 0 0 1;
    0 -1 0 -1 0 0 0 1;
    0 -1 0 0 -1 -1 0 1;
    0 -1 0 0 -1 -1 0 1;
    0 1 0 1 0 0 0 -1];
    
%Estado Inicial
%     
x0 = [1 0 0 0 0 0 0 0];

%---------------------------------------------------------%
%%% Requisito 1: Mostra as Sequências Possíveis

global tr 
tr = [];
% Não há disparos anteriores ao estado inicial
disparos_anteriores = "";
% 
N = 3;
sequencias_ate_N(x0,N,disparos_anteriores);
disp("-------------------------------------------")
disp(['Sequências até ', num2str(N) ,' disparos:'])
mostra_transicoes(tr);

%---------------------------------------------------------%
% Requisito 2: Retorna estado alcançado

% disp("-------------------------------------------")
% disp("Exemplos de sequências de disparos de transições:")
% fprintf("\n");
% TA = [Tbi; T0; T1; T0];
% x1 = retorna_estado(x0,TA);
% disp(['u = {Tbi, T0, T1, T0} => ', 'x = [',num2str(x1),']'])
% 
% TB = [T0];
% x2 = retorna_estado(x0,TB);
% disp(['u =  {T0} => ', 'x = [',num2str(x2),']'])
% 
% TC =[Tbi; T0; T1; Tbe2];
% x3 = retorna_estado(x0,TC);
% disp(['u = {Tbi, T0, T1, Tbe2} => ', 'x = [',num2str(x3),']'])
% 
% TD = [Tbi; Tbe2; ];
% x4 = retorna_estado(x0, TD);
% disp(['u = {Tbi, Tbe2} => ', 'x = [',num2str(x4),']'])
% 
% TE = [Tbi; T0; T1; T0; Tbe1; Tre; Tbf];
% x5 = retorna_estado(x0, TE);
% disp(['u = {Tbi, T0, T1, T0, Tbe1, Tre, Tbf} => ',...
%     'x = [',num2str(x5),']'])
%---------------------------------------------------------%
% Implementação de Funções

% Função para mostrar todas as transições possíveis até N
% disparos.
function mostra_transicoes(transitions)
    N = size(transitions,2);
    for k=1:N
        disp(transitions(1,k));
    end
end

% Função recursiva para gerar todas as transiçõe até N disparos
function sequencias_ate_N(x,N,past)
    % x: Estado de Partida
    % N: Número de Disparos
    % past: Transições anteriores ao estado x
    % Observação: Se x = x0, então past = {}, uma vez
    % que não há transições anteriores ao estado inicial.
    
    
    global A T tr Rot 

    for i=1:size(T,1)
        if N == 0
            return;
        end
        
        if check_transition(x,T(i,:))
            % Estado alcançado
            st = x+T(i,:)*A;
            
            % Vetor com disparos
            tr = [tr,past+Rot(i)];
            sequencias_ate_N(st,N-1,past+Rot(i));
        end
    end
end

%Retorna o Estado Alcançado por uma Sequência de Disparos
function x = retorna_estado(x,T)
   global A
    
    for i=1:size(T,1)
        if check_transition(x,T(i,:)) 
            x = x+T(i,:)*A;
        else
            x = "Transiçao Inválida";
            return;
        end
    end
%    disp("Estado Alcançado:")
%    disp(x)
end


%Verifica se transição está habilitada;
function X = check_transition(x,t)
    global A I
    
    x_destino = x + t*A;
    X = all(x_destino(:) >= 0);
    
    %Caso especial dos arcos (ON,BM) e (BM,ON)
    %Essa implementação permite prescindir
    %da análise da matriz de adjacência de entrada.
    if all(t == I(5,:))
        if x(2) == 0 || x(4) == 0
            X = 0;
        end
    end
end

