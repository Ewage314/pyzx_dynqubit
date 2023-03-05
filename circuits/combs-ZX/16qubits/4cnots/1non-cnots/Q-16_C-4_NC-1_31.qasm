OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[11];
cx q[2], q[6];
cx q[8], q[3];
cx q[7], q[1];
cx q[2], q[12];
