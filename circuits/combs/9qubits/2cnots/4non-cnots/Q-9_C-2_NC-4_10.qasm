OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[6];
cx q[4], q[6];
x q[3];
x q[2];
x q[8];
cx q[0], q[5];
