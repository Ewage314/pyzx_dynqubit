OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[7];
z q[7];
cx q[0], q[6];
cx q[3], q[8];
cx q[4], q[13];
