OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[0];
cx q[7], q[5];
x q[9];
cx q[8], q[6];
