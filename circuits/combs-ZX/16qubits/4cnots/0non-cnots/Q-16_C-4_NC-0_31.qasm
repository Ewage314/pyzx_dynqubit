OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[6];
cx q[9], q[8];
cx q[3], q[7];
cx q[12], q[0];
