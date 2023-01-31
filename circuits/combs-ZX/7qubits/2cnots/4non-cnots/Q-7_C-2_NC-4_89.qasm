OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[3], q[0];
z q[6];
z q[5];
x q[6];
z q[1];
cx q[1], q[0];
