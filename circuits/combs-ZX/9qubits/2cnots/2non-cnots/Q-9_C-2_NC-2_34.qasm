OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[6];
z q[5];
z q[6];
cx q[4], q[0];
