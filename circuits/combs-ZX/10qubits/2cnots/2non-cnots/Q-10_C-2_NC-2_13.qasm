OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[6];
z q[7];
x q[7];
cx q[9], q[3];
