OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[14];
cx q[7], q[12];
z q[2];
cx q[4], q[8];
cx q[8], q[5];
