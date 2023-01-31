OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[6];
cx q[9], q[2];
z q[0];
cx q[1], q[3];
x q[5];
cx q[1], q[5];
