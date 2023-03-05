OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[3];
cx q[6], q[4];
cx q[3], q[10];
cx q[15], q[10];
cx q[13], q[14];
