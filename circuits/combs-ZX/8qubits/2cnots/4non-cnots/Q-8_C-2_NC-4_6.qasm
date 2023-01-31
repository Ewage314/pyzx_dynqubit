OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[6], q[7];
z q[6];
z q[6];
x q[2];
z q[6];
cx q[6], q[2];
