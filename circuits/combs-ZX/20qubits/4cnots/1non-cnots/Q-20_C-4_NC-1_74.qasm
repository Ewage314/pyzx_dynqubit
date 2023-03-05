OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[9];
z q[4];
cx q[17], q[5];
cx q[0], q[7];
cx q[7], q[19];
