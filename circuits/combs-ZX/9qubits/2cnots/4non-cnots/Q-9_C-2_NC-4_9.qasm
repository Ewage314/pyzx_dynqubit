OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[2];
x q[0];
cx q[3], q[0];
z q[3];
z q[7];
cx q[6], q[5];
