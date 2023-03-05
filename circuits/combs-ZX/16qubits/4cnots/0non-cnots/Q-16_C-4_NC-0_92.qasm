OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[11];
cx q[9], q[11];
cx q[8], q[2];
cx q[15], q[9];
