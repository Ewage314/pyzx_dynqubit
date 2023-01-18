OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[5];
x q[4];
cx q[5], q[7];
cx q[6], q[8];
