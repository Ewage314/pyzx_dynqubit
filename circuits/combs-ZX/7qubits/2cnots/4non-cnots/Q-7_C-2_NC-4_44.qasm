OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[6];
x q[0];
x q[4];
z q[3];
cx q[1], q[5];
cx q[3], q[6];
