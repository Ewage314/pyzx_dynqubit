OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
x q[3];
x q[2];
x q[3];
x q[6];
cx q[5], q[8];
