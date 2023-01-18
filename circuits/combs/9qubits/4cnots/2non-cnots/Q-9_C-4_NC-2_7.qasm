OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
x q[5];
x q[3];
cx q[1], q[3];
cx q[7], q[5];
cx q[1], q[8];
