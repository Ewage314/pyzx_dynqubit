OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
x q[0];
z q[4];
cx q[14], q[0];
cx q[6], q[13];
cx q[3], q[6];
cx q[13], q[6];
