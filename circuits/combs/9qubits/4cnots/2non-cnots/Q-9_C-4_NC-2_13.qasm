OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[0], q[3];
cx q[5], q[0];
x q[1];
x q[4];
cx q[5], q[8];
