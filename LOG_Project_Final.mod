param TotTasks; #i
param TotWorkers; #j

set Tasks:=1..TotTasks;
set Workers:=1..TotWorkers;

param Duration{Tasks};

var assignedTasks{i in Tasks,j in Workers} binary;
var MaxWork >=0;

minimize Difference_Workload: MaxWork;

subject to TWConstr{i in Tasks}: sum { j in Workers}assignedTasks[i,j]=1;
subject to ProvaConstr{j in Workers}: sum {i in Tasks}assignedTasks[i,j]>=1;
subject to Constr1{j in Workers}: sum {i in Tasks}Duration[i]*assignedTasks[i,j]<=MaxWork
