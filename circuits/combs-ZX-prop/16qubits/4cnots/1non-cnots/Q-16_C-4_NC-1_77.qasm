OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[8];
cx q[9], q[12];
cx q[11], q[9];
cx q[7], q[8];
cx q[5], q[6];
