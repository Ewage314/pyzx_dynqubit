OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[0], q[2];
z q[4];
x q[7];
cx q[6], q[7];
