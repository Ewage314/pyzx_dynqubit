OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
x q[7];
x q[3];
cx q[7], q[8];
