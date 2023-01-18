OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[1];
x q[7];
cx q[8], q[7];
cx q[7], q[1];
