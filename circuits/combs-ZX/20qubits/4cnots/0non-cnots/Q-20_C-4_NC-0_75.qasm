OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[5];
cx q[18], q[19];
cx q[15], q[5];
cx q[9], q[7];
