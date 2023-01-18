OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[3];
x q[7];
cx q[8], q[5];
