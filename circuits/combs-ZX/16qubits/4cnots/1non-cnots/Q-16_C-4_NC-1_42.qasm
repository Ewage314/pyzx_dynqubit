OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[6];
z q[5];
cx q[14], q[13];
cx q[2], q[13];
cx q[14], q[2];
