OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[3];
cx q[8], q[0];
cx q[1], q[8];
x q[8];
cx q[2], q[5];
