OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[9];
cx q[14], q[15];
cx q[15], q[2];
cx q[6], q[9];
