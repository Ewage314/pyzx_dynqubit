OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[2];
x q[7];
cx q[0], q[5];
cx q[9], q[7];
