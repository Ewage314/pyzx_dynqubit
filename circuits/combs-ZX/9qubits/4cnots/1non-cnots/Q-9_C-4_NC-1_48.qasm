OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[4];
cx q[2], q[6];
cx q[5], q[6];
cx q[0], q[8];
cx q[7], q[5];
