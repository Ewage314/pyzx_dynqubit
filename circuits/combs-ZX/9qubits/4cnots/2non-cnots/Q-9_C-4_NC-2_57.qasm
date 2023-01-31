OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[8];
z q[0];
cx q[1], q[5];
cx q[2], q[5];
z q[3];
cx q[1], q[3];
