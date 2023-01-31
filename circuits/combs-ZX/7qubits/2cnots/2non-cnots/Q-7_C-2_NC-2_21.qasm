OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[6];
cx q[0], q[1];
z q[1];
cx q[2], q[3];
