OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[2];
x q[0];
x q[5];
cx q[9], q[6];
