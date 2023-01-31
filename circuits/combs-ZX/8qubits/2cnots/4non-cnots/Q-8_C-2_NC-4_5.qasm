OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[0];
z q[5];
z q[1];
z q[6];
cx q[5], q[2];
cx q[2], q[1];
