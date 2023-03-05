OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[11];
cx q[0], q[1];
cx q[10], q[15];
cx q[14], q[11];
