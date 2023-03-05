OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[1];
cx q[17], q[8];
z q[5];
cx q[19], q[6];
z q[8];
cx q[3], q[6];
