OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[8];
cx q[0], q[8];
cx q[14], q[15];
cx q[4], q[15];
