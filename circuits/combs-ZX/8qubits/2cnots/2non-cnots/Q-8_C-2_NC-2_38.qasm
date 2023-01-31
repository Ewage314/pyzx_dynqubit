OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[1], q[6];
z q[0];
z q[5];
cx q[6], q[2];
