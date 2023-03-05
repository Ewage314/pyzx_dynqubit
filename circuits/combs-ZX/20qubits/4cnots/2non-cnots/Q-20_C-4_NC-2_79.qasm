OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[8];
cx q[8], q[7];
z q[4];
cx q[17], q[9];
x q[5];
cx q[10], q[8];
