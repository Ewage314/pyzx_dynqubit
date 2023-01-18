OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[8];
cx q[8], q[2];
x q[2];
cx q[5], q[7];
cx q[0], q[7];
cx q[6], q[5];
