OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[13];
cx q[4], q[1];
cx q[14], q[13];
z q[13];
cx q[3], q[15];
