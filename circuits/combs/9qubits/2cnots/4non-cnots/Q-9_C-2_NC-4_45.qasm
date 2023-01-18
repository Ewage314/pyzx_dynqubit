OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[8];
x q[5];
x q[1];
x q[2];
cx q[5], q[0];
cx q[8], q[5];
