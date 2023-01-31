OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[1];
cx q[1], q[8];
x q[7];
x q[0];
z q[7];
cx q[6], q[0];
