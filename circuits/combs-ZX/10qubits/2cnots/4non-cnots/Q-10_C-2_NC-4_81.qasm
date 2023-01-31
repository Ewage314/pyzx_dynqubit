OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[0];
x q[4];
z q[0];
x q[8];
x q[5];
cx q[6], q[7];
