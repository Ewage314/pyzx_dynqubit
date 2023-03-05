OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[3];
cx q[0], q[9];
cx q[0], q[13];
cx q[6], q[9];
cx q[13], q[6];
