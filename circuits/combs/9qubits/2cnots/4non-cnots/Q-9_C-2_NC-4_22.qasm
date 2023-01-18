OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[3];
x q[3];
x q[3];
x q[8];
cx q[8], q[0];
cx q[3], q[5];
