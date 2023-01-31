OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[1];
z q[1];
cx q[2], q[3];
cx q[3], q[5];
