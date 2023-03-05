OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[12];
z q[9];
cx q[1], q[6];
cx q[14], q[5];
cx q[3], q[0];
