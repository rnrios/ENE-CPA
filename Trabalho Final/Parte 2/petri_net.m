%%% Rodrigo Naves Rios - 16/0144094
%%% Rede de Petri - Sistema 1

clear
close all
clc

%-------------------------------------------------------%
%Modelo da Rede

%Transi??es
global I
I = eye(13);
BON = I(1,:);
BOFF = I(2,:);
SON1 = I(3,:);
SON2 = I(4,:);
BM = I(5,:);
C1 = I(6,:);
C2 = I(7,:);
EM_OFF1 = I(8,:);
EM_OFF2 = I(9,:);
EM_OFF3 = I(10,:);
EM_OFF4 = I(11,:);
EM_OFF5 = I(12,:);
EM_ON = I(13,:);

%Vetor de Transi??es
global T 
T = [BON; BOFF; SON1; SON2; BM; C1; C2; EM_OFF1;...
    EM_OFF2; EM_OFF3; EM_OFF4; EM_OFF5; EM_ON];

%Rotulos das Transi??es
global Rot
Rot = ["Bon", "Boff", "Son", "Son", "Bm", "C1", "C2",...
    "Em_off", "Em_off","Em_off",...
    "Em_off","Em_off", "Em_on"];


global A
A = [1 -1 1 0 1 0 0 0 0;
    0 1 -1 -1 0 0 0 0 0;
    0 0 0 1 -1 -1 -1 0 0;
    0 0 0 1 -1 -1 0 -1 0;
    -1 0 0 0 0 1 1 0 0;
    0 0 0 0 0 0 -1 1 0;
    0 0 0 0 0 0 1 -1 0;
    0 0 -1 0 0 0 0 0 1;
    0 0 -1 0 -1 0 0 0 1;
    0 0 -1 0 0 -1 -1 0 1;
    0 0 -1 0 0 -1 0 -1 1;
    0 0 -1 -1 0 0 0 0 1;
    0 0 1 0 0 0 0 0 -1];
    
%Estado Inicial
%   x = [Im OFF ON SC SN M SM1 SM2 EM] 
x0 = [0 1 0 0 0 0 0 0 0];

%---------------------------------------------------------%
%%% Requisito 1: Mostra as Sequ?ncias Poss?veis

global tr 
tr = [];
% N?o h? disparos anteriores ao estado inicial
disparos_anteriores = "";
% 
N = 4;
sequencias_ate_N(x0,N,disparos_anteriores);
tr = unique(tr);
disp("-------------------------------------------")
disp(['Sequ?ncias at? ', num2str(N) ,' disparos:'])
mostra_transicoes(tr);

%---------------------------------------------------------%
%Requisito 2: Retorna estado alcan?ado
disp("-------------------------------------------")
disp("Exemplos de sequ?ncias de disparos de transi??es:")
fprintf("\n");
TA = [BON; BM; SON1];
x1 = retorna_estado(x0,TA);
disp(['u = {Bon, Bm, Son} => ', 'x = [',num2str(x1),']'])

TB = [BM];
x2 = retorna_estado(x0,TB);
disp(['u =  {Bm} => ', 'x = [',num2str(x2),']'])

TC =[BON];
x3 = retorna_estado(x0,TC);
disp(['u = {Bon} => ', 'x = [',num2str(x3),']'])

TD = [BON; EM_OFF1; EM_ON];
x4 = retorna_estado(x0, TD);
disp(['u = {Bon, Em_off, Em_on} => ', 'x = [',num2str(x4),']'])

TE = [BON; BM; C1; C2; SON1; BOFF];
x5 = retorna_estado(x0, TE);
disp(['u = {B_on, B_m, C1, C2, Son, Boff} => ',...
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
    global A I
    
    x_destino = x + t*A;
    X = all(x_destino(:) >= 0);
    
    %Caso especial dos arcos (ON,BM) e (BM,ON)
    %Essa implementa??o permite prescindir
    %da an?lise da matriz de adjac?ncia de entrada.
    if all(t == I(5,:))
        if x(3) == 0
            X = 0;
        end
    end
end

