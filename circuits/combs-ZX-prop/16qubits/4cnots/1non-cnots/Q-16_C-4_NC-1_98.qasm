OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[0];
cx q[14], q[11];
x q[4];
cx q[9], q[15];
cx q[12], q[15];
