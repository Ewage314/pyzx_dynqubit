OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[0];
z q[5];
x q[4];
z q[4];
cx q[0], q[1];
cx q[6], q[0];
