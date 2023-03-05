OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[14];
cx q[5], q[10];
cx q[14], q[5];
cx q[14], q[13];
