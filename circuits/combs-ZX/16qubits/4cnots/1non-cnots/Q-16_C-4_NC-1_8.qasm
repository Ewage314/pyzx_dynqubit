OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[10];
x q[1];
cx q[3], q[13];
cx q[4], q[12];
cx q[14], q[1];
