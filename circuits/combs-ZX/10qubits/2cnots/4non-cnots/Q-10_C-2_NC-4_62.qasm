OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[7];
x q[2];
z q[1];
cx q[9], q[7];
z q[5];
cx q[2], q[3];
