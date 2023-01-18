OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[1], q[2];
x q[1];
cx q[1], q[2];
cx q[0], q[6];
cx q[7], q[1];
cx q[6], q[2];
