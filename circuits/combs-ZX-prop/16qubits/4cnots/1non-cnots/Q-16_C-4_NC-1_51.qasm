OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[4];
cx q[9], q[5];
cx q[15], q[11];
z q[10];
cx q[6], q[1];
