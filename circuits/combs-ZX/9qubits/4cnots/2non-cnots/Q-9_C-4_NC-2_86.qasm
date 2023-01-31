OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[1];
cx q[2], q[8];
z q[3];
cx q[0], q[7];
cx q[5], q[8];
cx q[3], q[5];
