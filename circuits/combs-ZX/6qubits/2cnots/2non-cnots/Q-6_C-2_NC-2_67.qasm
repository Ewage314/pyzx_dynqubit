OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
z q[4];
x q[3];
cx q[3], q[0];
cx q[0], q[4];
