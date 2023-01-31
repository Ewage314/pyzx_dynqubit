OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[8];
cx q[9], q[2];
z q[5];
cx q[7], q[6];
