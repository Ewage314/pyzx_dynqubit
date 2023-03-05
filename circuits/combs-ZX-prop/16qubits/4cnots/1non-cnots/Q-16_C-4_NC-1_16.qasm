OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[7];
cx q[3], q[6];
cx q[10], q[11];
cx q[7], q[12];
cx q[13], q[4];
