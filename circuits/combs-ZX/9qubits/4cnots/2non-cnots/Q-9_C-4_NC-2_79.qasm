OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[2];
z q[5];
cx q[0], q[4];
cx q[8], q[4];
cx q[3], q[5];
cx q[5], q[2];
