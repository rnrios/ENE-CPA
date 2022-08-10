#include <iostream>
#include <vector>
#include<string>
using namespace std;

vector<vector<char> > adj;
vector<int> ftrans;
vector<char> events;

//Função para mostrar matriz
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


//Preenche vetor de inteiros com os estados de destino associados a cada conjunto (estado,palavra).
//Preenche vetor de caracteres com os eventos que representam a transição de cada estado.
void fill_vect(vector<vector<char> > mat){
    int count = 0;
    for(int i = 0; i<mat.size(); i++){
        for(int j =0; j<mat.size(); j++){
            //Adiciona o evento de transição associado a um estado
            events.push_back(mat[i][j]);
            //Adiciona o valor da colouna de dado elemento da matriz de adjacencias (estado de destino)
            ftrans.push_back(j);
            count++;
        }
    }
}

int main(){
    adj = {{0x00, 0x00,  'a', 0x00, 0x00},
           {'a',  0x00, 0x00, 0x00, 0x00},
           {'b', 'c',  0x00, 'a', 0x00},
           {0x00, 0x00, 0x00, 'c', 'b'},
           {0x00, 'b', 0x00, 'a', 0x00 }};
    vector<vector<int> > vec;

    fill_vect(adj);
    //N é o tamanho do vetor que representa os estados de destino de cada transição x1 -> x2
    //Como se convencionou que cada transição está associada a um único evento, N = nxn (número de estados).
    int N = ftrans.size();
    cout << "Matriz de adjacencias";
    cout << endl;
    mostra_matriz(adj);
    int n_linhas = adj.size();
    for (int i = 0; i < N; i++){
        if (events[i] != 0){
            cout << endl;
            //Mostra todas as transições válidas para cada estado
            cout<< "f[" + to_string(i/n_linhas) + "][" + events[i] + "] : " + to_string(ftrans[i]);

        }
    }

    return 0;
}
