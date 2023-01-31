OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[6];
z q[7];
x q[7];
x q[0];
cx q[5], q[1];
cx q[0], q[1];
