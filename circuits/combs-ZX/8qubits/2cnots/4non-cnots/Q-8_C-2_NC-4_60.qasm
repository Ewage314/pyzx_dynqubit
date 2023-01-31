OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[2];
x q[1];
x q[6];
z q[0];
cx q[5], q[0];
cx q[3], q[1];
