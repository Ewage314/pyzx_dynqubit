OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[6];
cx q[11], q[8];
z q[3];
cx q[10], q[12];
cx q[5], q[3];
