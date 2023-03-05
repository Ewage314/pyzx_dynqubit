OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[5];
cx q[19], q[13];
cx q[14], q[13];
cx q[2], q[5];
