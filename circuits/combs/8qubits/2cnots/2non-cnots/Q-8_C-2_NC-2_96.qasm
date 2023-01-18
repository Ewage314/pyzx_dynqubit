OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[1];
x q[2];
cx q[5], q[3];
cx q[3], q[2];
