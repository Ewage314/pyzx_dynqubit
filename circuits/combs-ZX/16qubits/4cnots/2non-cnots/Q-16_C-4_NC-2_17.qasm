OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[2];
cx q[7], q[13];
cx q[4], q[5];
cx q[9], q[0];
z q[9];
cx q[7], q[0];
