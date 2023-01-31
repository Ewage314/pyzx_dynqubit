OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[7];
z q[6];
cx q[6], q[3];
x q[1];
x q[3];
cx q[5], q[7];
