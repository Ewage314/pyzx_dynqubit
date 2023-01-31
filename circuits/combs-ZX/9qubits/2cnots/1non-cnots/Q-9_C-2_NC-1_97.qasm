OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[5];
cx q[1], q[8];
cx q[4], q[8];
