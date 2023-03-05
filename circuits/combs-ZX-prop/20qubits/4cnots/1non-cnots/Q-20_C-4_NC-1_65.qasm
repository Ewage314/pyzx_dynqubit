OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[1];
cx q[1], q[18];
x q[19];
cx q[4], q[8];
cx q[0], q[2];
