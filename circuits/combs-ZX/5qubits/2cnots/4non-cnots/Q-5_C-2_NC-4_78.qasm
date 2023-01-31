OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
cx q[2], q[3];
z q[3];
z q[1];
z q[2];
z q[2];
cx q[1], q[4];
