OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[15];
cx q[12], q[17];
cx q[19], q[8];
cx q[17], q[10];
cx q[19], q[4];
