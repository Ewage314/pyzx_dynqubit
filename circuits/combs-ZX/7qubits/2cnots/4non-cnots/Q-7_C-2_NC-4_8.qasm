OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[5];
x q[2];
x q[3];
cx q[2], q[6];
z q[0];
cx q[0], q[6];
