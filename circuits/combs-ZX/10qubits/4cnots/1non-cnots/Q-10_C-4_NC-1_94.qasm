OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[5];
cx q[1], q[8];
cx q[2], q[4];
z q[7];
cx q[6], q[7];
