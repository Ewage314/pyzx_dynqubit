OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[4];
x q[0];
cx q[7], q[2];
cx q[2], q[5];
