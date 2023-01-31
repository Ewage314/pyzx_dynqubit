OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[7];
cx q[0], q[7];
cx q[2], q[7];
x q[6];
z q[5];
cx q[3], q[1];
