OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[7];
z q[1];
z q[3];
z q[7];
cx q[5], q[7];
cx q[4], q[2];
