OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[3];
cx q[13], q[4];
cx q[10], q[2];
z q[3];
cx q[4], q[1];
