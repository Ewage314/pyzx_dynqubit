OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
z q[2];
z q[4];
cx q[3], q[1];
cx q[1], q[4];
