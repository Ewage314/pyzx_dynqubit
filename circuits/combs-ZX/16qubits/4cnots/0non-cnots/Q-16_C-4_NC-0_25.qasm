OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[8];
cx q[8], q[6];
cx q[14], q[6];
cx q[4], q[13];
