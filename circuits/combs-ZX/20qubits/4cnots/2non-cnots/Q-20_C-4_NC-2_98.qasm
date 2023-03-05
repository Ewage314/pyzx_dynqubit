OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[14];
cx q[9], q[18];
cx q[8], q[14];
z q[1];
z q[4];
cx q[10], q[15];
