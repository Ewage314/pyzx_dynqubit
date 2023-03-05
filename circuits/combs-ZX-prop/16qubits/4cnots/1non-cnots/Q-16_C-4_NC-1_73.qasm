OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[14];
cx q[4], q[7];
cx q[14], q[9];
cx q[1], q[2];
cx q[2], q[6];
