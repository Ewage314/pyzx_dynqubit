OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[5];
x q[1];
z q[3];
x q[6];
cx q[4], q[0];
cx q[7], q[0];
