OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[8];
cx q[15], q[4];
cx q[12], q[0];
cx q[7], q[8];
cx q[4], q[6];
