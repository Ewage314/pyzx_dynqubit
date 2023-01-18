OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[0];
x q[7];
x q[0];
cx q[4], q[7];
x q[4];
cx q[7], q[5];
