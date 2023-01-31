OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[5];
cx q[9], q[2];
x q[9];
cx q[7], q[1];
