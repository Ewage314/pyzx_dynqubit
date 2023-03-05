OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[17];
z q[10];
cx q[8], q[18];
cx q[19], q[17];
cx q[19], q[2];
