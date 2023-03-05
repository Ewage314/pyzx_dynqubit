OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[9];
cx q[7], q[14];
cx q[5], q[8];
cx q[13], q[4];
