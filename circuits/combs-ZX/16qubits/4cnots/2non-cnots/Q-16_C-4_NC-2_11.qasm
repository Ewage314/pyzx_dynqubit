OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[13];
x q[14];
z q[1];
cx q[2], q[12];
cx q[9], q[15];
cx q[10], q[13];
