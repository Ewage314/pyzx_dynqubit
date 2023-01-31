OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[0];
x q[6];
z q[1];
cx q[5], q[3];
x q[5];
cx q[6], q[8];
