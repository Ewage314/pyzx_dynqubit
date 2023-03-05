OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[5];
cx q[15], q[14];
cx q[7], q[5];
cx q[7], q[10];
cx q[11], q[8];
