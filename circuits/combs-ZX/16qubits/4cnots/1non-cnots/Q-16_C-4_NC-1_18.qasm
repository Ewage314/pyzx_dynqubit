OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[9];
cx q[4], q[3];
cx q[4], q[3];
z q[0];
cx q[8], q[15];
