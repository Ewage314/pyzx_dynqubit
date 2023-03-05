OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[9];
cx q[1], q[5];
cx q[3], q[9];
z q[13];
cx q[11], q[12];
