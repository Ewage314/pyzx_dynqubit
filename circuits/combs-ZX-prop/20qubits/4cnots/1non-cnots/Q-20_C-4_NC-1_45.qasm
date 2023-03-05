OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[15];
cx q[19], q[8];
cx q[11], q[7];
cx q[4], q[10];
cx q[16], q[12];
