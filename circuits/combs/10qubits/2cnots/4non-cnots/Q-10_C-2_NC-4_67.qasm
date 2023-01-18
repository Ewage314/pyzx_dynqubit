OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[4];
x q[0];
x q[5];
x q[8];
cx q[2], q[1];
cx q[6], q[7];
