OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[6];
x q[7];
cx q[2], q[1];
