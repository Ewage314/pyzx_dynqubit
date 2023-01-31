OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[5];
cx q[2], q[6];
z q[4];
cx q[6], q[1];
