OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[18];
cx q[1], q[9];
z q[4];
cx q[0], q[12];
cx q[2], q[3];
