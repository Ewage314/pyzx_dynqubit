OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[3];
cx q[0], q[1];
cx q[8], q[0];
