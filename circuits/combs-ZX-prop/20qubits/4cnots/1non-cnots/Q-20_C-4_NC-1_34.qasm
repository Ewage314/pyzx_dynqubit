OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[17];
x q[16];
cx q[14], q[6];
cx q[13], q[3];
cx q[4], q[3];
