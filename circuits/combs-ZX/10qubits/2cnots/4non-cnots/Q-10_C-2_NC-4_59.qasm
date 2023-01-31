OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[5];
x q[7];
z q[0];
x q[5];
z q[3];
cx q[6], q[8];
