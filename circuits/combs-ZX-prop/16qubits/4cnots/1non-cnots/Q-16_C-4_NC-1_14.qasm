OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[15];
cx q[13], q[1];
cx q[13], q[12];
x q[1];
cx q[1], q[13];
