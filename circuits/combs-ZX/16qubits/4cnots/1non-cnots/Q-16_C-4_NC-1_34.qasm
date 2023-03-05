OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[11];
cx q[13], q[9];
cx q[9], q[1];
cx q[15], q[14];
cx q[9], q[8];
