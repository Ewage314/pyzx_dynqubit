OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[1];
cx q[5], q[2];
x q[1];
cx q[3], q[1];
