OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[1];
x q[7];
cx q[2], q[5];
cx q[1], q[0];
x q[0];
cx q[1], q[4];
