OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[1];
cx q[7], q[0];
x q[1];
cx q[0], q[4];
