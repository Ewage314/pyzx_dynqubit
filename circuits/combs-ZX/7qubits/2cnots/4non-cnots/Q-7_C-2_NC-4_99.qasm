OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[4], q[6];
z q[4];
x q[1];
x q[3];
z q[6];
cx q[0], q[3];
