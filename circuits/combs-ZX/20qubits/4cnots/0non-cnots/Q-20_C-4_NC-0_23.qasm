OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[15];
cx q[12], q[14];
cx q[3], q[12];
cx q[1], q[13];
