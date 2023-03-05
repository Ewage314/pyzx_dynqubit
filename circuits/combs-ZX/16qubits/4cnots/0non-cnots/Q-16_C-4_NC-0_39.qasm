OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[0], q[13];
cx q[11], q[13];
cx q[4], q[10];
cx q[3], q[14];
