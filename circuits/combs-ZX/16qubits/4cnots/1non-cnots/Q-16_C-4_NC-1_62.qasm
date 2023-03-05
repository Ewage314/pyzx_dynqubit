OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[6];
cx q[11], q[8];
cx q[4], q[12];
cx q[7], q[11];
cx q[13], q[2];
