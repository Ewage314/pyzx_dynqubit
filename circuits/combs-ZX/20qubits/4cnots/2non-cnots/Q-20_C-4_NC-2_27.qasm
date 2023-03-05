OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[15];
z q[14];
cx q[6], q[17];
z q[12];
cx q[6], q[4];
cx q[0], q[19];
