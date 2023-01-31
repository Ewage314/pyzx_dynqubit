OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[7];
z q[0];
cx q[0], q[1];
x q[1];
z q[0];
cx q[7], q[6];
