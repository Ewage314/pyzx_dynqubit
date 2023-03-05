OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[9];
z q[8];
cx q[15], q[17];
cx q[13], q[7];
cx q[16], q[10];
