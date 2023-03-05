OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[6];
z q[4];
cx q[1], q[6];
cx q[3], q[15];
cx q[2], q[12];
