OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
z q[9];
cx q[8], q[5];
cx q[9], q[0];
