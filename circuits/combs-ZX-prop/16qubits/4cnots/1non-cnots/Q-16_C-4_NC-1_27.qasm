OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
z q[8];
cx q[13], q[8];
cx q[6], q[7];
cx q[3], q[14];
