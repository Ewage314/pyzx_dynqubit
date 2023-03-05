OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[15];
z q[9];
cx q[9], q[0];
cx q[11], q[6];
cx q[2], q[9];
