OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[8];
z q[9];
z q[3];
cx q[0], q[7];
