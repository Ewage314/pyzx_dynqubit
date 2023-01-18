OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
x q[1];
x q[4];
cx q[8], q[0];
