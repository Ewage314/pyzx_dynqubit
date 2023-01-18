OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[1];
x q[6];
cx q[6], q[1];
x q[1];
x q[2];
cx q[8], q[4];
