OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
cx q[0], q[1];
x q[0];
x q[0];
cx q[1], q[3];
