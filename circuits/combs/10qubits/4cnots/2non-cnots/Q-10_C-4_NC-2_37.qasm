OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
x q[1];
cx q[7], q[8];
cx q[2], q[1];
cx q[0], q[8];
cx q[9], q[2];
