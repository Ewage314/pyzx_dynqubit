OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[2];
cx q[1], q[15];
cx q[2], q[12];
cx q[11], q[3];
cx q[13], q[6];
