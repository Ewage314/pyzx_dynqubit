OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[2];
cx q[7], q[8];
x q[1];
z q[2];
z q[3];
cx q[3], q[7];
