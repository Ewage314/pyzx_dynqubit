OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[8];
z q[9];
cx q[4], q[10];
z q[12];
cx q[8], q[15];
cx q[6], q[7];
