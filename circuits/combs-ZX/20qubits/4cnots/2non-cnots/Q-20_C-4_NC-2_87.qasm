OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[1];
cx q[13], q[17];
cx q[18], q[15];
z q[15];
cx q[9], q[2];
cx q[0], q[9];
