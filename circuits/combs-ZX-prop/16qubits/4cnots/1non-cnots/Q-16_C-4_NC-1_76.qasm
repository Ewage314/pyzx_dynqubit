OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[7];
z q[9];
cx q[15], q[4];
cx q[0], q[11];
cx q[5], q[3];
