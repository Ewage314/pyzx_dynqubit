OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[9];
cx q[9], q[18];
cx q[0], q[1];
x q[19];
cx q[1], q[8];
