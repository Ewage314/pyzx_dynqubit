OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[2];
z q[1];
z q[8];
cx q[7], q[8];
z q[1];
cx q[1], q[6];
