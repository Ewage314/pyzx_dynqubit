OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[4];
z q[3];
cx q[2], q[6];
cx q[2], q[4];
