OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[3];
cx q[13], q[5];
cx q[5], q[13];
z q[0];
cx q[13], q[9];
