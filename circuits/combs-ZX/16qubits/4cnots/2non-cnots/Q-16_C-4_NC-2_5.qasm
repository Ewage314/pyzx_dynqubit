OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[12];
z q[13];
cx q[10], q[13];
cx q[6], q[2];
z q[13];
cx q[2], q[3];
