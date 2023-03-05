OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[10];
cx q[2], q[6];
cx q[15], q[8];
z q[0];
cx q[6], q[1];
