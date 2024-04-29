#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string>
#include<cstdlib>

using namespace std;

struct Operation {
    int type;  
    int input1, input2;  
    int output;  
};

struct ALU {
    vector<vector<int> > resources;  
    
    ALU(int numAdders, int numMultipliers, int maxSteps = 100) {
        resources.resize(maxSteps, vector<int>(2));  
        for (int i = 0; i < maxSteps; ++i) {
            resources[i][0] = numAdders;   
            resources[i][1] = numMultipliers; 
        }
    }


    int& get(int step, int type) {
        return resources[step][type];
    }

    void use(int step, int type, int count) {
        if (step + count > resources.size()) {
            cerr << "Error: Attempting to use resources beyond the preallocated steps." << endl;
            return;
        }

        for (int i = step; i < step + count; ++i) {
            resources[i][type]--;
            if (resources[i][type] < 0) {
                cerr << "Warning: Resources went negative at step " << i << " for type " << (type == 0 ? "Adder" : "Multiplier") << "." << endl;
            }
        }
    }
};


struct ScheduleEntry {
    int step; 
    int opIndex;  
};

struct CompareScheduleEntry {
    bool operator()(const ScheduleEntry& a, const ScheduleEntry& b) {
        return a.step < b.step;
    }
};

class ListScheduler{
public:
    ListScheduler(int numOperations) : operations(numOperations) {}

    void addOperation(int index, int type, int input1, int input2, int output) {
        operations[index] = {type, input1, input2, output};
    }

    void scheduleOperations(int numAdders, int numMultipliers, int addTime, int mulTime) {
        ALU alu(numAdders, numMultipliers, 100);
        /*
        cout << "Initial ALU State:" << endl;
    	for (size_t i = 0; i < alu.resources.size(); ++i) {
        	cout << "Step " << i << ": ";
        	for (size_t j = 0; j < alu.resources[i].size(); ++j) {
            	cout << (j == 0 ? "Adders: " : "Multipliers: ") << alu.resources[i][j] << " ";
        	}
        	cout << endl;
    	}*/
        vector<ScheduleEntry> schedule;
        for (size_t i = 0; i < operations.size(); ++i) {
            int earliestStep = findEarliestStep(i, schedule, addTime, mulTime, alu);
            schedule.push_back({earliestStep, static_cast<int>(i)});
            updateALU(alu, operations[i].type, earliestStep, addTime, mulTime);
        }
        sort(schedule.begin(), schedule.end(), CompareScheduleEntry());
        for (size_t i = 0; i < schedule.size(); ++i) {
            ScheduleEntry& entry = schedule[i];
            Operation& op = operations[entry.opIndex];
            cout << "Step " << entry.step << ": Perform operation " << op.type
                 << " on inputs " << op.input1 << " and " << op.input2
                 << " to produce output " << op.output << endl;
        }
    }

private:
    vector<Operation> operations;

    int findEarliestStep(int opIndex, const vector<ScheduleEntry>& schedule, int addTime, int mulTime, ALU& alu) {
    	int earliestStep = 1; // initial step
    	int operationType = operations[opIndex].type;
    	int typeIndex = (operationType == 1 ? 0 : 1);  // 0 for adders, 1 for multipliers

    	for (size_t j = 0; j < schedule.size(); ++j) {
        	const ScheduleEntry& entry = schedule[j];
        	const Operation& previousOp = operations[entry.opIndex];
        	if (previousOp.output == operations[opIndex].input1 ||
            	previousOp.output == operations[opIndex].input2) {
            	int operationTime = (previousOp.type == 1 ? addTime : mulTime);
            	earliestStep = max(earliestStep, entry.step + operationTime);
        	}
    	}
    	while (alu.get(earliestStep, typeIndex) <= 0) {
    		//cout << "Stuck at step: " << earliestStep << " for type: " << (typeIndex == 0 ? "Adder" : "Multiplier") << " with available: " << alu.get(earliestStep, typeIndex) << endl;
        	earliestStep++;
    	}
    
    	return earliestStep;
	}


    void updateALU(ALU& alu, int operationType, int startStep, int addTime, int mulTime) {
    	int operationTime = (operationType == 1 ? addTime : mulTime);
    	int typeIndex = (operationType == 1 ? 0 : 1);  // 0 for adders , 1 for multipliers
    	alu.use(startStep, typeIndex, operationTime);
	}

};

int main(int argc, char* argv[]) {
    string filename = argv[1];
    ifstream file(filename.c_str()); 
    if (!file.is_open()) {
        cerr << "Failed to open the file." << endl;
        return 1;
    }

    int numOperations;
    file >> numOperations;
    ListScheduler scheduler(numOperations);

    for (int i = 0; i < numOperations; i++) {
        int type, input1, input2, output;
        file >> type >> input1 >> input2 >> output;
        scheduler.addOperation(i, type, input1, input2, output);
    }
    
    file.close();

    int numAdders = atoi(argv[2]), numMultipliers = atoi(argv[3]), addTime = atoi(argv[4]), mulTime = atoi(argv[5]);
    scheduler.scheduleOperations(numAdders, numMultipliers, addTime, mulTime);
    
    return 0;
}


