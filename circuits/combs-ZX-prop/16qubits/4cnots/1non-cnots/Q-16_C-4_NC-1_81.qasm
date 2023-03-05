OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[3];
cx q[0], q[6];
cx q[10], q[12];
z q[13];
cx q[4], q[3];
