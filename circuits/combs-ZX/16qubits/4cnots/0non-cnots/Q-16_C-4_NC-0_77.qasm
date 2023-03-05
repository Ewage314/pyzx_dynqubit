OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[13];
cx q[11], q[4];
cx q[12], q[15];
cx q[14], q[12];
