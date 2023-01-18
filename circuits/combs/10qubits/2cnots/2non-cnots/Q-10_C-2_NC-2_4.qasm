OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[5];
x q[8];
x q[6];
cx q[7], q[9];
