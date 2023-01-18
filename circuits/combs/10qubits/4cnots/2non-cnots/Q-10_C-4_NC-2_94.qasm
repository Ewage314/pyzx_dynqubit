OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[0];
x q[5];
cx q[8], q[2];
x q[9];
cx q[1], q[3];
cx q[3], q[5];
