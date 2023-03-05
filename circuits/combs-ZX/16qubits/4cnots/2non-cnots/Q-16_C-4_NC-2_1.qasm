OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[12], q[10];
cx q[1], q[13];
cx q[7], q[13];
z q[9];
z q[3];
cx q[9], q[0];
