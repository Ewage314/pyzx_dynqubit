OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[2];
cx q[7], q[5];
cx q[3], q[8];
z q[8];
cx q[6], q[5];
cx q[7], q[4];
