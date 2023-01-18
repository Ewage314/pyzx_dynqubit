OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
x q[0];
x q[4];
cx q[1], q[3];
cx q[1], q[2];
