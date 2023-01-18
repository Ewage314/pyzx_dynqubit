OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[4];
x q[4];
cx q[1], q[2];
x q[7];
x q[0];
cx q[1], q[5];
