OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[3];
cx q[1], q[4];
cx q[5], q[1];
x q[5];
cx q[8], q[4];
