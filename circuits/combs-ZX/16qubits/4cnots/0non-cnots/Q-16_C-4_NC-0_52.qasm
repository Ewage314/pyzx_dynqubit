OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[2];
cx q[12], q[4];
cx q[14], q[4];
cx q[10], q[5];
