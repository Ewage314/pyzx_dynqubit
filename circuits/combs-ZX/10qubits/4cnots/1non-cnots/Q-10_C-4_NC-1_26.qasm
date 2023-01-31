OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[4];
cx q[0], q[1];
x q[5];
cx q[9], q[1];
cx q[1], q[3];
