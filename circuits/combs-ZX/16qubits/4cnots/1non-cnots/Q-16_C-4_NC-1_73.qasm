OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[14];
cx q[11], q[5];
cx q[2], q[15];
cx q[11], q[15];
cx q[3], q[1];
