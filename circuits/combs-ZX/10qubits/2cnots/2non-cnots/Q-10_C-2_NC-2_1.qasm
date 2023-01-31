OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[8];
z q[2];
z q[3];
cx q[8], q[4];
