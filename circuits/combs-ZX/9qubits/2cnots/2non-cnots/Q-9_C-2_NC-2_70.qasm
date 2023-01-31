OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[6];
z q[4];
cx q[2], q[8];
cx q[3], q[0];
