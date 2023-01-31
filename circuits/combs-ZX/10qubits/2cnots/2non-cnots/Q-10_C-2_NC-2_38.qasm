OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[3];
cx q[8], q[5];
z q[4];
cx q[4], q[8];
