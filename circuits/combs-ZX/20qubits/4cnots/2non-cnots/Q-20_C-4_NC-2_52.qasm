OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[8];
cx q[1], q[15];
z q[0];
cx q[4], q[5];
cx q[9], q[3];
cx q[10], q[14];
