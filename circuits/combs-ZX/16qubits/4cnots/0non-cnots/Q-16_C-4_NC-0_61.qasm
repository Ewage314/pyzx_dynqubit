OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[12];
cx q[8], q[2];
cx q[3], q[12];
cx q[15], q[8];
