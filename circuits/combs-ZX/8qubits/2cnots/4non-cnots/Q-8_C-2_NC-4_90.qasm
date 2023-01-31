OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[7];
z q[2];
z q[1];
cx q[2], q[7];
z q[1];
cx q[4], q[7];
