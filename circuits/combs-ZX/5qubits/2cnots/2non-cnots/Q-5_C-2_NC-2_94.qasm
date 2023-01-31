OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
x q[3];
z q[1];
cx q[3], q[1];
cx q[3], q[4];
