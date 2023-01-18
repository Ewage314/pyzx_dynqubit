OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[8];
x q[9];
cx q[3], q[5];
cx q[8], q[5];
cx q[2], q[0];
cx q[9], q[1];
