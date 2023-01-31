OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[2];
z q[4];
z q[6];
cx q[6], q[3];
x q[0];
cx q[0], q[5];
