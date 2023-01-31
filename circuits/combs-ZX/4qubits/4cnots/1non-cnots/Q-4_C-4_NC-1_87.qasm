OPENQASM 2.0;
include "qelib1.inc";
qreg q[4];
cx q[2], q[0];
cx q[0], q[2];
z q[3];
cx q[2], q[0];
cx q[2], q[0];
