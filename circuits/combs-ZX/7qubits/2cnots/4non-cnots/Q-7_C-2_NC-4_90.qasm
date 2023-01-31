OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[4];
x q[2];
x q[5];
z q[2];
cx q[3], q[5];
cx q[3], q[4];
