OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
cx q[2], q[1];
x q[2];
x q[5];
cx q[3], q[1];
