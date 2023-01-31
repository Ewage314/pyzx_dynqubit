OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[3];
cx q[6], q[2];
z q[5];
x q[4];
z q[2];
cx q[6], q[3];
