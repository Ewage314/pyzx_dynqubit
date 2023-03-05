OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[3];
cx q[6], q[7];
cx q[0], q[4];
z q[4];
cx q[6], q[5];
