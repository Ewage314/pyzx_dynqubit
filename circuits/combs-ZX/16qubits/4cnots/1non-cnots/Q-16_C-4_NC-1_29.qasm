OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[9];
cx q[14], q[5];
z q[3];
cx q[12], q[2];
cx q[4], q[6];
