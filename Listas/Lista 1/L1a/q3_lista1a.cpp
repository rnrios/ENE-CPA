#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

vector<int> coac_states;

//Mostra a matriz de adjacências. Transições não definidas marcadas como "-"
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


//Cria vetor coluna a partir de um índice e da matriz de entrada
vector<char> extract_column(vector<vector<char> > mat, int col){
    int N = mat.size();
    vector<char> row_vector;

    for(int i=0; i<N; i++){
        for(int j=0; j<N; j++){
            if (j == col)
                row_vector.push_back(mat[i][j]);
        }
    }
    return row_vector;
}


//Verifica se tal elemento pertence a um dado vetor. Retorna 0 caso contrario.
int is_in(vector<int> arr, int x){
    int val = 0;
    for (auto & element: arr){
        if (element == x)
            val = 1;
    }
    return val;
}


//Função recursiva para verificar estados coacessiveis.
//Os estados coacessiveis são armazenados em coac.
void verifica_coac(vector<vector<char> > mat, int x){
    //Vetor com estados cuja transição para o estado anterior é definida.
    vector<char> mat_col = extract_column(mat,x);
    for (int i = 0; i<mat.size(); i++){
        //Verifica somente transições que sejam definidas.
        if(mat_col[i] != 0x00){
            //Criterio de parada (quando não há mais nenhuma transição possível).
            if(is_in(coac_states, i))
                return;
            else{
                //Vai para o proximo estado coacessivel.
                coac_states.push_back(i);
                verifica_coac(mat,i);
            }
        }
    }
}


//A partir da mascara de bits, retorna um vetor contendo os estados marcados
vector<int> retorna_marcados(int Xm, int N){
    vector<int> arr;

    for (int i = 0; i < N; i++){
        if (((Xm >> i) & 0x01) != 0) {
            arr.push_back(i);
        }
    }

    return arr;
}


vector<char>  retorna_coac(vector<vector<char> > mat_in){
    vector<char> vec_out;

    for (int i = 0;i<mat_in.size();i++){
        for(int j = 0;j<mat_in.size();j++) {
            if(is_in(coac_states, i) &is_in(coac_states, j)){
                vec_out.push_back(mat_in[i][j]);
            }
        }
    }
    return vec_out;
}


vector<vector<char> >  vec_to_mat(vector<char>  vec_in) {
    int count = 0;
    int N = sqrt(vec_in.size());
    vector<vector<char>> mat_out(N, vector<char>(N));

    for(int i = 0; i < N;i++){
        for(int j = 0; j < N; j++){
            mat_out[i][j] = vec_in[count];
            count++;
        }
    }
    return mat_out;
}

int main(){
    vector<vector<char> > adj = {
            {0x00, 'a',  0x00, 0x00, 0x00, 0x00},
            {0x00,  0x00, 'b', 'a', 0x00, 'g'},
            {'g',  0x00, 0x00, 0x00, 0x00, 0x00},
            {0x00,  0x00, 0x00, 0x00, 'b', 0x00},
            {0x00,  0x00, 0x00, 'a', 'g', 0x00},
            {0x00, 0x00,  0x00, 0x00, 0x00, 0x00}};
    int Xm = 0x04;
    vector<char> vec_coac;
    vector<vector<char>> mat_coac;
    cout << "Mascara de bits (Xm): " << Xm << endl;
    cout << "Matriz de Entrada" << endl;
    mostra_matriz(adj);

    //Vetor de estados marcados
    vector<int> marked = retorna_marcados(Xm,adj.size());
    //Verifica os Estados Coacesiveis. Estes estados ficam armazenados no vetor global "coac"
    for(auto & i: marked){
        coac_states.push_back(i);
        verifica_coac(adj, i);
    }
    //Cria vetor com as transições de CoAc(G)
    vec_coac = retorna_coac(adj);
    //Transforma vetor na matriz CoAc(G)
    mat_coac = vec_to_mat(vec_coac);
    cout  << "Matriz do Automato Coacessivel" << endl;
    mostra_matriz(mat_coac);
    return 0;
}
