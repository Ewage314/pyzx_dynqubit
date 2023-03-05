OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[15];
cx q[8], q[12];
x q[12];
cx q[1], q[13];
cx q[5], q[15];
