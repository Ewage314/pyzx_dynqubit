OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[8];
cx q[15], q[0];
cx q[6], q[3];
z q[13];
cx q[7], q[0];
cx q[13], q[10];
