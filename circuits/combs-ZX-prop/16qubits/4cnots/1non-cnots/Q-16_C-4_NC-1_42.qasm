OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[11];
z q[5];
cx q[9], q[13];
cx q[10], q[14];
cx q[9], q[11];
