OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[3];
x q[7];
x q[5];
cx q[4], q[7];
z q[6];
cx q[6], q[7];
