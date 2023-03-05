OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[0];
cx q[5], q[9];
cx q[14], q[10];
z q[0];
cx q[9], q[12];
