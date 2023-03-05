OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[8];
cx q[11], q[5];
cx q[14], q[4];
cx q[15], q[11];
cx q[4], q[12];
