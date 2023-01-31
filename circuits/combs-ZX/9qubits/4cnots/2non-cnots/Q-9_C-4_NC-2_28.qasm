OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[4];
cx q[1], q[0];
x q[6];
cx q[3], q[4];
z q[8];
cx q[8], q[0];
