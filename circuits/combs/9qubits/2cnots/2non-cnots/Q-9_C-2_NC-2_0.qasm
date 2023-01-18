OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[7];
cx q[2], q[0];
x q[7];
cx q[7], q[1];
