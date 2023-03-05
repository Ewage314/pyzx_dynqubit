OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[14], q[6];
z q[7];
cx q[9], q[3];
z q[2];
cx q[1], q[15];
