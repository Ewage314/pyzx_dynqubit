OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[1], q[3];
x q[8];
cx q[3], q[5];
z q[7];
cx q[3], q[1];
