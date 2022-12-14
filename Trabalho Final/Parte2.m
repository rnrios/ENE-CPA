%%% Rodrigo Naves Rios - 16/0144094
%%% Rede de Petri - Sistema 1

clear
close all
clc

%-------------------------------------------------------%
%Modelo da Rede
Tbi = [1 0 0 0 0 0 0];
T0 = [0 1 0 0 0 0 0];
T1 = [0 0 1 0 0 0 0];
Tbf = [0 0 0 1 0 0 0];
Tbe1 = [0 0 0 0 1 0 0];
Tbe2 = [0 0 0 0 0 1 0];
Tre = [0 0 0 0 0 0 1];

global A
A = [-1 1 0 1 0 0 0;
    0 0 1 -1 1 0 0;
    0 0 -1 1 -1 0 0;
    1 -1 0 -1 0 0 0;
    0 -1 -1 0 -1 1 -1;
    0 -1 0 -1 0 1 -1;
    0 1 0 0 0 -1 1];

%Estado Inicial
%     I Sf S1 S2 M Se Be 
x0 = [1 0 0 0 0 0 1];

%Rotulos das Transi??es
global Rot
Rot = ["Tbi", "T0", "T1", "Tbf", "Te",...
    "Te", "Tre"];

%Vetor de Transi??es
global T 
T = [Tbi; T0; T1; Tbf; Tbe1; Tbe2; Tre];

%---------------------------------------------------------%
%%% Requisito 1: Mostra as Sequ?ncias Poss?veis

global tr 
tr = [];
% N?o h? disparos anteriores ao estado inicial
disparos_anteriores = "";
% 
N = 6;
sequencias_ate_N(x0,N,disparos_anteriores);
disp("-------------------------------------------")
disp(['Sequ?ncias at? ', num2str(N) ,' disparos:'])
mostra_transicoes(tr);

%---------------------------------------------------------%
% Requisito 2: Retorna estado alcan?ado

disp("-------------------------------------------")
disp("Exemplos de sequ?ncias de disparos de transi??es:")
fprintf("\n");
TA = [Tbi; T0; T1; T0];
x1 = retorna_estado(x0,TA);
disp(['u = {Tbi, T0, T1, T0} => ', 'x = [',num2str(x1),']'])

TB = [T0];
x2 = retorna_estado(x0,TB);
disp(['u =  {T0} => ', 'x = [',num2str(x2),']'])

TC =[Tbi; T0; T1; Tbe2];
x3 = retorna_estado(x0,TC);
disp(['u = {Tbi, T0, T1, Tbe2} => ', 'x = [',num2str(x3),']'])

TD = [Tbi; Tbe2; ];
x4 = retorna_estado(x0, TD);
disp(['u = {Tbi, Tbe2} => ', 'x = [',num2str(x4),']'])

TE = [Tbi; T0; T1; T0; Tbe1; Tre; Tbf];
x5 = retorna_estado(x0, TE);
disp(['u = {Tbi, T0, T1, T0, Tbe1, Tre, Tbf} => ',...
    'x = [',num2str(x5),']'])
%---------------------------------------------------------%
% Implementa??o de Fun??es

% Fun??o para mostrar todas as transi??es poss?veis at? N
% disparos.
function mostra_transicoes(transitions)
    N = size(transitions,2);
    for k=1:N
        disp(transitions(1,k));
    end
end

% Fun??o recursiva para gerar todas as transi??e at? N disparos
function sequencias_ate_N(x,N,past)
    % x: Estado de Partida
    % N: N?mero de Disparos
    % past: Transi??es anteriores ao estado x
    % Observa??o: Se x = x0, ent?o past = {}, uma vez
    % que n?o h? transi??es anteriores ao estado inicial.
    
    
    global A T tr Rot 

    for i=1:size(T,1)
        if N == 0
            return;
        end
        
        if check_transition(x,T(i,:))
            % Estado alcan?ado
            st = x+T(i,:)*A;
            
            % Vetor com disparos
            tr = [tr,past+Rot(i)];
            sequencias_ate_N(st,N-1,past+Rot(i));
        end
    end
end

%Retorna o Estado Alcan?ado por uma Sequ?ncia de Disparos
function x = retorna_estado(x,T)
   global A
    
    for i=1:size(T,1)
        if check_transition(x,T(i,:)) 
            x = x+T(i,:)*A;
        else
            x = "Transi?ao Inv?lida";
            return;
        end
    end
%    disp("Estado Alcan?ado:")
%    disp(x)
end


%Verifica se transi??o est? habilitada;
function X = check_transition(x,t)
    global A
    
    x_destino = x + t*A;
    X = all(x_destino(:) >= 0);
    
    %Caso especial dos arcos (Sf,t0) e (t0,Sf)
    %A matriz de adjac?ncias t?m elemento 0 nessa posi??o,
    %mas isso se deve ao fato de que h? um arco saindo de t0 
    %e outro entrando. Essa implementa??o permite prescindir
    %da an?lise da matriz de adjac?ncia de entrada.
    if all(t == [0 1 0 0 0 0 0])
        if x(2) < 1
            X = 0;
        end
    end
end

