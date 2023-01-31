OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[9];
z q[9];
z q[4];
cx q[1], q[6];
