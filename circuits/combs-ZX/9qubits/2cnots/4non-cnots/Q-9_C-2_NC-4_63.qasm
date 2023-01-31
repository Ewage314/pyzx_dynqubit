OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[0];
x q[3];
x q[7];
x q[6];
cx q[6], q[5];
cx q[3], q[4];
