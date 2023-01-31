OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[0];
x q[6];
cx q[7], q[6];
x q[8];
z q[3];
cx q[3], q[0];
