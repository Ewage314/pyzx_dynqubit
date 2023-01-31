OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[0];
z q[5];
cx q[2], q[8];
z q[4];
z q[4];
cx q[4], q[5];
