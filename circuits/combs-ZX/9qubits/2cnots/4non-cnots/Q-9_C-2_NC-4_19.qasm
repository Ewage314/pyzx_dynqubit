OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
z q[7];
x q[2];
z q[3];
z q[1];
cx q[7], q[8];
