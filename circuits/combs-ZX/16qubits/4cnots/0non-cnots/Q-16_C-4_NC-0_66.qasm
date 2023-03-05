OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[7];
cx q[6], q[14];
cx q[3], q[15];
cx q[0], q[11];
