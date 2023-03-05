OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[4];
cx q[13], q[3];
cx q[1], q[15];
cx q[9], q[3];
cx q[8], q[4];
