OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[1], q[6];
z q[2];
z q[5];
cx q[2], q[5];
