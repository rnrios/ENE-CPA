// Your First C++ Program

#include <iostream>
#include <vector>
#include <string>
using namespace std;

vector<string>  Ln = {};
vector<string>  Lnm = {};
vector<vector<char> > adj;
int Xm;


//Mostra cada elemento do vetor de palavras
void mostra_lista(vector<string> list){
    int N = list.size();
    int count = 1;
    for(auto & x: list) {
        cout << x ;
        if(count<N)
            cout << ", ";
        count++;
    }
}

//Mostra de forma ordenada a matriz. Transições não definidas são representadas por "-"
void mostra_matriz(vector<vector<char> > mat){
    for (auto & line : mat){
        for(auto & x: line) {
            if (x != 0x00){
                cout << ' ' << x;
            }
            else{
                cout << ' ' << '-';
            }
        }
        cout << "\n";
    }
}

//Função que retorna todas as palavras geradas a partir de estados alcançados
//pelo estado inicial
void adiciona_lista(string s,vector<char> C, int count, int N){
    count += 1;
    string aux;
    for(int i = 0; i<C.size(); i++){
        if (C[i] != 0x00){
            //Concatena a palavra existente com a da transição atual
            aux = s + C[i];
            //Criterio de parada
            if(count == N){
                //Adiciona cada palavra com tamanho N
                Ln.push_back(aux);
                //Se o estado a ser alcançado é marcado, adicionar a Lnm
                if(((Xm >> i) & 0x01) != 0){
                    Lnm.push_back(aux);
                }
            }
            else{
                //Se o tamanho da palavra for menor que N, adiciona a palavra e chama a função recursiva
                Ln.push_back(aux);
                if(((Xm >> i) & 0x01) != 0){
                    Lnm.push_back(aux);
                }
                //Chamada recursiva para formar as palavras obtidas pelo estado atual
                adiciona_lista(aux,adj[i],count,N);
            }
        }
    }
    return;
}

//Função que adiciona todas as palavras unitárias formadas a partir do estado inicial.
//O restante das palavras é adicionado pela função "adiciona_lista", recursiva, chamada
//por esta
void language_to_n(vector<vector<char> > mat, int N){
    string s;
    for (int i = 0;i < mat.size(); i++){
        if (mat[0][i] != 0x00){
            s = string(1, mat[0][i]);
            //Adiciona as palavras alcançadas pelo estado inicial
            Ln.push_back(s);
            //As palavras geradas a partir dos estados alcançados são adicionadas pela função chamada
            adiciona_lista(s, mat[i],1,N);
            if(((Xm >> i) & 0x01) != 0){
                Lnm.push_back(s);
            }
        }
    }
}


//Função que troca valor de strings. Chamada por sort_size.
void swap(string &x, string &y){
    string aux;
    aux = x;
    x = y;
    y = aux;

    return;
}

// Função que ordena o vetor de acordo com o tamanho da string
vector<string> sort_size(vector<string> arr){
    for(int i = 0; i < arr.size()-1; i++){
        for (int j=0; j<arr.size()-i-1; j++){
            if (arr[j].size()>arr[j+1].size())
                swap(arr[j],arr[j+1]);
        }
    }
    return arr;
}


int main() {
    adj = {{0x00, 'a'},
           {'b', 'a'}};
    Xm = 0x02;
    int N;
    cout << "Mascara de bits (Xm): " << Xm << endl;
    cout << "Matriz de Adjacencias" << endl;
    mostra_matriz(adj);
    cout << endl << "Entre com o numero N:";
    cin >> N;

    language_to_n(adj,N);
    Ln = sort_size(Ln);
    cout << endl << "Linguagem Gerada ate N = " + to_string(N) + ":" << endl;
    mostra_lista(Ln);
    Lnm = sort_size(Lnm);
    cout << endl << "Linguagem Marcada ate N = " + to_string(N) + ":" << endl;
    mostra_lista(Lnm);
    return 0;
}


