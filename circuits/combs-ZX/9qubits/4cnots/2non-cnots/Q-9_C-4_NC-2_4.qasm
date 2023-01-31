OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[2];
cx q[7], q[2];
cx q[8], q[5];
cx q[4], q[5];
z q[3];
cx q[7], q[6];
