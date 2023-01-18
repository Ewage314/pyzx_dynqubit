OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
x q[0];
cx q[5], q[4];
