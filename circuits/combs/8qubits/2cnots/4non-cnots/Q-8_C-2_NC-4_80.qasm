OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[2];
x q[6];
x q[5];
cx q[1], q[5];
x q[6];
cx q[3], q[6];
