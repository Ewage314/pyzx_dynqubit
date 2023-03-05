OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[6];
cx q[13], q[2];
cx q[14], q[9];
cx q[13], q[1];
