OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[2];
cx q[1], q[2];
cx q[5], q[12];
cx q[10], q[8];
cx q[14], q[3];
