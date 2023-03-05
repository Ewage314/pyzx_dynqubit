OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[13];
cx q[6], q[13];
cx q[0], q[12];
cx q[14], q[2];
z q[2];
cx q[11], q[14];
