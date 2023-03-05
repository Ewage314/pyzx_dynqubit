OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[4];
cx q[9], q[0];
cx q[12], q[1];
