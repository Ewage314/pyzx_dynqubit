OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[18];
cx q[19], q[16];
cx q[7], q[10];
z q[5];
cx q[17], q[5];
