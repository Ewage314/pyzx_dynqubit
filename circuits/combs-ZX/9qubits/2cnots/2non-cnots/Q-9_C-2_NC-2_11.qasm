OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
x q[6];
x q[0];
cx q[0], q[7];
