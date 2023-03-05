OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[13];
cx q[15], q[6];
z q[11];
cx q[6], q[1];
cx q[6], q[11];
