OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[1];
x q[8];
cx q[5], q[4];
x q[4];
x q[8];
cx q[7], q[0];
