OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[5];
x q[3];
x q[6];
cx q[0], q[1];
