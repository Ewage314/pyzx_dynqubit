OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[5];
cx q[4], q[7];
z q[6];
x q[2];
z q[0];
cx q[7], q[2];
