OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[11];
cx q[9], q[6];
cx q[15], q[11];
x q[14];
cx q[13], q[8];
