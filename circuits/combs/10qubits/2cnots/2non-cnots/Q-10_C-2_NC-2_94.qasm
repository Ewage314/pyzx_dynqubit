OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[0];
cx q[7], q[4];
x q[0];
cx q[0], q[8];
