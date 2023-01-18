OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
x q[8];
x q[5];
cx q[7], q[6];
