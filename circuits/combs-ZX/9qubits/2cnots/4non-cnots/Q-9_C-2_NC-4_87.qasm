OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[1];
x q[1];
cx q[7], q[5];
x q[6];
z q[5];
cx q[7], q[0];
