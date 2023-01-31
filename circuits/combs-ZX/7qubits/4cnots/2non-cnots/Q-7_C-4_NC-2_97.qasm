OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[1], q[4];
cx q[2], q[6];
cx q[6], q[5];
x q[1];
z q[0];
cx q[6], q[3];
