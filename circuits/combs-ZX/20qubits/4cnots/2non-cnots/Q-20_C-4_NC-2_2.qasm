OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[2];
z q[7];
cx q[15], q[2];
cx q[10], q[7];
cx q[1], q[19];
cx q[8], q[11];
