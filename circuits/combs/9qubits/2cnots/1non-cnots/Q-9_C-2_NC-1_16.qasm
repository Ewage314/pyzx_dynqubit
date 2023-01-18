OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[4];
cx q[1], q[6];
cx q[4], q[8];
