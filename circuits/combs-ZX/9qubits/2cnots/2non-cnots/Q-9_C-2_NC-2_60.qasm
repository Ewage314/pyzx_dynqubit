OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[5];
cx q[7], q[8];
z q[5];
cx q[1], q[4];
