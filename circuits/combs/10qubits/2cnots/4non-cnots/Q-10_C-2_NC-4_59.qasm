OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[4];
x q[8];
x q[4];
cx q[0], q[3];
x q[2];
cx q[8], q[7];
