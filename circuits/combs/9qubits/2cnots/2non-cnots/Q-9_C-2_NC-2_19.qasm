OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[6];
cx q[1], q[4];
x q[3];
cx q[0], q[1];
