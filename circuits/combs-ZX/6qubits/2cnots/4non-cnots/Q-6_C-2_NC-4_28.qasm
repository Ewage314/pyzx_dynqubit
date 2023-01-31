OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[0];
x q[1];
x q[1];
cx q[3], q[2];
x q[5];
cx q[3], q[5];
