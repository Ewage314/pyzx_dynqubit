OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[4];
cx q[6], q[13];
x q[3];
cx q[14], q[13];
cx q[13], q[10];
