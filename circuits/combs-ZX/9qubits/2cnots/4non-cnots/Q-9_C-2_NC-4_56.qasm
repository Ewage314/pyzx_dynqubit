OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[8];
cx q[7], q[5];
z q[1];
x q[7];
z q[5];
cx q[0], q[6];
