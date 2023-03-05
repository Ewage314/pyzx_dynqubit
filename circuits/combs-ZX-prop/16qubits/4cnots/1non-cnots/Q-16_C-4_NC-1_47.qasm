OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[5];
cx q[12], q[1];
z q[2];
cx q[9], q[13];
cx q[5], q[7];
