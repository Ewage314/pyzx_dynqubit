OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[4];
x q[6];
z q[7];
x q[6];
cx q[1], q[3];
cx q[7], q[4];
