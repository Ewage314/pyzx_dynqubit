OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[1];
x q[4];
x q[3];
x q[4];
x q[4];
cx q[7], q[4];
