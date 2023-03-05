OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[10];
cx q[14], q[7];
cx q[15], q[2];
z q[5];
cx q[6], q[8];
