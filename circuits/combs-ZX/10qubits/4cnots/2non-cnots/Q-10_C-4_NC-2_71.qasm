OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[3];
x q[7];
cx q[6], q[3];
cx q[4], q[8];
cx q[2], q[7];
cx q[3], q[9];
