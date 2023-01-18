OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
x q[3];
cx q[8], q[3];
