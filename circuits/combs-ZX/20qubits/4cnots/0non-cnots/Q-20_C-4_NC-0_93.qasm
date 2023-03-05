OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[1], q[16];
cx q[14], q[9];
cx q[19], q[13];
