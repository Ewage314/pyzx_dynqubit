OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[6];
z q[0];
x q[5];
z q[6];
cx q[6], q[0];
cx q[3], q[6];
