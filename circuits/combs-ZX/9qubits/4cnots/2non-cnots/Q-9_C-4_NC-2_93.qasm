OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[5];
cx q[7], q[5];
cx q[4], q[6];
z q[7];
cx q[1], q[3];
cx q[2], q[1];
