OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[1];
z q[4];
cx q[2], q[8];
cx q[0], q[8];
cx q[7], q[5];
cx q[8], q[9];
