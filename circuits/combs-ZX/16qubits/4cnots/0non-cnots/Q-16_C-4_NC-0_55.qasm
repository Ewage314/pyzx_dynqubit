OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[5];
cx q[12], q[14];
cx q[6], q[13];
cx q[3], q[15];
