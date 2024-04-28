#include<iostream>
#include<vector>
#include<string>
#include<algorithm>

using namespace std;

// Function to simulate the logic gate behavior
int simulate_gate(const string& gate, int a, int b = 0) {
    if (gate == "NAND") return !(a && b);
    if (gate == "NOR") return !(a || b);
    if (gate == "NOT") return !a;
}

// Function to simulate the entire circuit with a given input vector
int simulate_circuit(const vector<int>& input) { //vector<int>: 0110 (A3,A2,A1,A0)
    // Simulate each gate's behavior based on the input
    int n1 = simulate_gate("NAND", input[0], input[1]);
    int n2 = simulate_gate("NOT", input[2]);
    int n3 = simulate_gate("NOR", n2, input[3]);
    int y = simulate_gate("NAND", n1, n3);

    return y;
}

int simulate_circuit_stuck(vector<int> input, int edge, int flag){ //vector<int>: 0110 (A3,A2,A1,A0)
	
	int y;
	if (flag){
		if (edge < 4){
			input[edge] = 1;
			int n1 = simulate_gate("NAND", input[0], input[1]);
    		int n2 = simulate_gate("NOT", input[2]);
    		int n3 = simulate_gate("NOR", n2, input[3]);
    		y = simulate_gate("NAND", n1, n3);
    	}
    	else if (edge == 4){
    		int n1 = 1;
    		int n2 = simulate_gate("NOT", input[2]);
    		int n3 = simulate_gate("NOR", n2, input[3]);
    		y = simulate_gate("NAND", n1, n3);
    	}
    	else if (edge == 5){
			int n1 = simulate_gate("NAND", input[0], input[1]);
    		int n2 = 1;
    		int n3 = simulate_gate("NOR", n2, input[3]);
    		y = simulate_gate("NAND", n1, n3);
		}	
    	else if (edge == 6){
    		int n1 = simulate_gate("NAND", input[0], input[1]);
    		int n2 = simulate_gate("NOT", input[2]);
    		int n3 = 1;
    		y = simulate_gate("NAND", n1, n3);
    	}
    	else if (edge == 7){
    		int n1 = simulate_gate("NAND", input[0], input[1]);
    		int n2 = simulate_gate("NOT", input[2]);
    		int n3 = simulate_gate("NOR", n2, input[3]);
    		y =  1;
    	}
	}
    else{
    	if (edge < 4){
    		input[edge] =0;
			int n1 = simulate_gate("NAND", input[0], input[1]);
    		int n2 = simulate_gate("NOT", input[2]);
    		int n3 = simulate_gate("NOR", n2, input[3]);
    		y = simulate_gate("NAND", n1, n3);
		}		
    	else if (edge == 4){
    		int n1 = 0;
    		int n2 = simulate_gate("NOT", input[2]);
    		int n3 = simulate_gate("NOR", n2, input[3]);
    		y = simulate_gate("NAND", n1, n3);
		}
    	else if (edge == 5){
			int n1 = simulate_gate("NAND", input[0], input[1]);
    		int n2 = 0;
    		int n3 = simulate_gate("NOR", n2, input[3]);
    		y = simulate_gate("NAND", n1, n3);
		}
    	else if (edge == 6){
    		int n1 = simulate_gate("NAND", input[0], input[1]);
    		int n2 = simulate_gate("NOT", input[2]);
    		int n3 = 0;
    		y = simulate_gate("NAND", n1, n3);	
		}
    	else if (edge == 7){
			int n1 = simulate_gate("NAND", input[0], input[1]);
    		int n2 = simulate_gate("NOT", input[2]);
    		int n3 = simulate_gate("NOR", n2, input[3]);
    		y =  0;
		}
	}
	return y;	
}

void PrintStucktype(int i,int flag){
	string stuck;
	string edge;
	if(flag){
		stuck = "1";
	}
	else{
		stuck = "0";
	}
	if(i==0){
		edge = "A3";
	}
	else if(i ==1){
		edge = "A2";
	}
	else if(i==2){
		edge = "A1";
	}
	else if(i==3){
		edge = "A0";
	}
	else if(i==4){
		edge = "n1";
	}
	else if(i==5){
		edge = "n2";
	}
	else if(i==6){
		edge = "n3";
	}
	else{
		edge = "Y";
	}
	cout << edge << " SA"  << stuck << ":" << endl << "\t";
}

void PrintFormatInfo(int j){
	int arr[4];
	for(int index = 3; index >= 0;index--){
		int trans = 3 - index ;
		arr[index] = ((j >> trans) & 1);
	}
	
	for (int index = 0; index < 4; index++){
		cout<<arr[index];
	}
}

void FindMinimumSet(int **arr, vector<int>& miniset){
	//sum column
	int sum_column[16] = {0};
	for (int j = 0;j<16;j++){
		for(int i = 0;i<16;i++){
			sum_column[j] += arr[i][j];
		}
	}
	
	//get biggest element -> index save to the miniset
	int max_index = 0;
	for (int i =0;i<16;i++){
		if(sum_column[i] > sum_column[max_index])
			max_index = i;
	}
	miniset.push_back(max_index);
	
	//get row num vector to eliminate 1-row
	vector<int> eliminate_one_to_zero;
	for(int i=0;i<16;i++){
		if(arr[i][max_index]==1)
			eliminate_one_to_zero.push_back(i);
	}
	

	
	//start to eliminate 1-row
	for(int i=0;i<eliminate_one_to_zero.size();i++){
		int row = eliminate_one_to_zero[i];
		for(int j=0;j<16;j++){
			arr[row][j] = 0;
		}
	}
	
	//check if all zero
	int check_all_zero = 0;
	for(int i = 0;i<16;i++){
		for(int j =0;j<16;j++){
			if(arr[i][j]!=0)
				check_all_zero+=1;
		}
	}
	
	if(check_all_zero == 0){
		//cout<<"exit properly";
		return;
	}
	
	FindMinimumSet(arr,miniset);
	
}


// Function to test for stuck-at faults
void test_stuck_at_faults(vector<vector<int> >& test_vectors) {
    int **stuck_all_situation = new int *[16];
    for(int x = 0;x<16;x++)
    	stuck_all_situation[x] = new int[16];
    for (int x = 0;x<16;x++){
    	for (int y =0;y<16;y++)
    		stuck_all_situation[x][y] = 0;
	}
	for (int i = 0; i < 8; ++i) {

        // Test for stuck-at 1 fault
		PrintStucktype(i,1); 
        for (int j = 0; j < 16; ++j) {
        	vector<int> vector = test_vectors[j]; // Get the test vector
        	int expected_output = simulate_circuit(vector); // Simulate the circuit without faults
        	
            int output_with_fault = simulate_circuit_stuck(vector,i,1);
            
			if (output_with_fault != expected_output) {
                PrintFormatInfo(j);
                cout << "\t";
                stuck_all_situation[i*2][j] = 1;
                //break;
            }
        }
        cout<<endl;
        // Test for stuck-at 0 fault 
        PrintStucktype(i,0);
        for (int j = 0; j < 16; ++j) {
        	vector<int> vector = test_vectors[j]; // Get the test vector
        	int expected_output = simulate_circuit(vector); // Simulate the circuit without faults
        	
            int output_with_fault = simulate_circuit_stuck(vector,i,0);
            
            if (output_with_fault != expected_output) {
            	
            	PrintFormatInfo(j);
                cout << "\t";
                stuck_all_situation[i*2+1][j] = 1;
                //break;
            }
        }
        cout<<endl;
    }
    
    
    cout<<endl;
    for(int i=0;i<16;i++){
    	for(int j=0;j<16;j++){
    		cout<<stuck_all_situation[i][j] <<" ";
		}
		cout<<endl;
	}
	cout<<endl;
    
    vector<int> Minimum_set;
    FindMinimumSet(stuck_all_situation,Minimum_set);
    
    //sort vector
    sort(Minimum_set.begin(), Minimum_set.end());
    
    //Print Minimum set
    cout << endl << "Minimum Set: {\t" ;
    for(int i=0;i<Minimum_set.size();i++){
    	PrintFormatInfo(Minimum_set[i]);
    	cout<<"\t";
	}
	cout<<"}"<<endl;
}

int main() {
    vector< vector<int> > test_set;
    
    for (int i = 0; i < 16; ++i) {
        vector<int> combination;
        for (int j = 3; j >= 0; j--) {
            // For each bit in integer i, shift it right by j and check if the least significant bit is 1
            combination.push_back((i >> j) & 1);
        }
        test_set.push_back(combination);
    }
    

    // Test for stuck-at faults
    test_stuck_at_faults(test_set);

}

