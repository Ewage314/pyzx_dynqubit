OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[2];
cx q[6], q[0];
cx q[4], q[3];
