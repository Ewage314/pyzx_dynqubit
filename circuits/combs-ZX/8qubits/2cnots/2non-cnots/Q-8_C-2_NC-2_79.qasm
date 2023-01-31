OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[0], q[7];
z q[3];
x q[3];
cx q[4], q[2];
