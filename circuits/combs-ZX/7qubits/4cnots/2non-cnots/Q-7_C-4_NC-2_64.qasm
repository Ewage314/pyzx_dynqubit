OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[3];
cx q[5], q[3];
x q[6];
cx q[2], q[5];
cx q[6], q[2];
cx q[1], q[0];
