OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[3], q[5];
cx q[2], q[4];
cx q[8], q[6];
z q[4];
z q[3];
cx q[8], q[1];
