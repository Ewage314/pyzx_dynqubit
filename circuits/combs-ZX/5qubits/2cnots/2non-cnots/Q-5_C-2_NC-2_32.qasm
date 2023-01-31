OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
cx q[1], q[2];
z q[4];
z q[4];
cx q[0], q[2];
