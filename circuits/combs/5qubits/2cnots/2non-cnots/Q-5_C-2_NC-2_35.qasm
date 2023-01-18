OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
x q[4];
cx q[0], q[2];
x q[3];
cx q[3], q[0];
