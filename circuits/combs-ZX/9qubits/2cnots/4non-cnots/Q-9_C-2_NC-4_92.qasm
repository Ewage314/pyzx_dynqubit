OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[0];
x q[7];
x q[2];
z q[6];
x q[3];
cx q[6], q[4];
