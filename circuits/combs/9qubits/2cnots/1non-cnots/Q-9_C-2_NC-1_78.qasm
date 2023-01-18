OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[6];
x q[3];
cx q[4], q[5];
