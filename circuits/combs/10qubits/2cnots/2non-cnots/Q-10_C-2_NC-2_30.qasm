OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[6];
x q[3];
x q[9];
cx q[3], q[1];
