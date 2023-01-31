OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[1];
cx q[2], q[8];
cx q[0], q[7];
z q[1];
z q[8];
cx q[2], q[8];
