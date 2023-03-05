OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
x q[1];
cx q[9], q[7];
z q[7];
cx q[6], q[9];
cx q[1], q[10];
