/*#include<iostream>
#include<algorithm>
#include<fstream>
#include<string>
#include<sstream>
#include<array>

using namespace std;

const size_t SIZE = 120;

struct cdfg{
	int op, op1, op2, result;
	
};

int main(void){
	
}*/

#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string>

using namespace std;

struct Operation {
    int type;  
    int input1, input2;  
    int output;  
};

struct ALU {
    int numAdders;  
    int numMultipliers;  
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

class ListScheduler {
public:
    ListScheduler(int numOperations) : operations(numOperations) {}

    void addOperation(int index, int type, int input1, int input2, int output) {
        operations[index] = {type, input1, input2, output};
    }

    void scheduleOperations(int numAdders, int numMultipliers, int addTime, int mulTime) {
        ALU alu = {numAdders, numMultipliers};
        vector<ScheduleEntry> schedule;
        for (size_t i = 0; i < operations.size(); ++i) {
            int earliestStep = findEarliestStep(i, schedule, addTime, mulTime);
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

    int findEarliestStep(int opIndex, const std::vector<ScheduleEntry>& schedule, int addTime, int mulTime) {
        int earliestStep = 0;
        for (size_t j = 0; j < schedule.size(); ++j) {
            const ScheduleEntry& entry = schedule[j];
            const Operation& previousOp = operations[entry.opIndex];
            if (previousOp.output == operations[opIndex].input1 ||
                previousOp.output == operations[opIndex].input2) {
                int operationTime = previousOp.type == 1 ? addTime : mulTime;
                earliestStep = std::max(earliestStep, entry.step + operationTime);
            }
        }
        return earliestStep;
    }

    void updateALU(ALU& alu, int operationType, int startStep, int addTime, int mulTime) {
        int operationTime = operationType == 1 ? addTime : mulTime;
        for (int i = startStep; i < startStep + operationTime; i++) {
            if (operationType == 1) {
                alu.numAdders -= 1;
            } else {
                alu.numMultipliers -= 1;
            }
        }
    }
};

int main() {
    string filename;
    cout << "Please input the file name:";
    cin >> filename;
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

    int numAdders = 1, numMultipliers = 1, addTime = 1, mulTime = 2;
    //file >> numAdders >> numMultipliers >> addTime >> mulTime;
    scheduler.scheduleOperations(numAdders, numMultipliers, addTime, mulTime);
    
    return 0;
}





