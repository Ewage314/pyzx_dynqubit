OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[3];
x q[6];
z q[5];
x q[5];
x q[0];
cx q[8], q[6];
