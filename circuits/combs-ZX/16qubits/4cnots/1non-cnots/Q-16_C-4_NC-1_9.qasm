OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[13];
cx q[14], q[12];
cx q[5], q[14];
cx q[3], q[4];
cx q[9], q[5];
