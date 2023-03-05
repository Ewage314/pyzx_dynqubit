OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[6];
cx q[14], q[12];
cx q[8], q[12];
cx q[14], q[3];
