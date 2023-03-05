OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[13];
cx q[5], q[9];
cx q[16], q[9];
cx q[5], q[18];
