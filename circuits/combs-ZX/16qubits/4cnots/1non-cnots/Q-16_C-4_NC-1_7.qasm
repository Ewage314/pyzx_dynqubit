OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[12];
cx q[14], q[12];
z q[7];
cx q[4], q[11];
cx q[1], q[11];
