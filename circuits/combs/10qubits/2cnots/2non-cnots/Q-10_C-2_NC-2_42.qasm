OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[8];
x q[7];
x q[2];
cx q[2], q[3];
