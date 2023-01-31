OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[4];
cx q[6], q[2];
cx q[5], q[1];
cx q[0], q[2];
cx q[0], q[5];
