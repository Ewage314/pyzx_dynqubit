OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[7];
x q[0];
x q[7];
x q[3];
x q[8];
cx q[6], q[8];
