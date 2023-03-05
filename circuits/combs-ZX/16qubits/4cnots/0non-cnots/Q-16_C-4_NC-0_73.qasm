OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[14];
cx q[7], q[1];
cx q[6], q[8];
cx q[5], q[11];
