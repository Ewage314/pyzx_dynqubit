OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[5];
x q[9];
x q[3];
cx q[5], q[8];
cx q[8], q[1];
cx q[5], q[1];
