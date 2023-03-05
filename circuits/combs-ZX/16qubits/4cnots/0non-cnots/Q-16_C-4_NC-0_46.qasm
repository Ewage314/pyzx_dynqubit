OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[14];
cx q[0], q[8];
cx q[6], q[12];
cx q[3], q[15];
