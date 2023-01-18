OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[7];
cx q[7], q[9];
x q[4];
cx q[0], q[3];
