OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[4];
z q[11];
cx q[3], q[8];
z q[10];
cx q[3], q[4];
cx q[14], q[15];
