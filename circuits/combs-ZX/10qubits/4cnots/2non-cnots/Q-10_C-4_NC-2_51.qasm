OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[3];
cx q[8], q[3];
x q[0];
cx q[5], q[1];
z q[3];
cx q[1], q[9];
