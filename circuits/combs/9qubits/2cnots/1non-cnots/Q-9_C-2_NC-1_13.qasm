OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[0];
cx q[0], q[2];
cx q[4], q[1];
