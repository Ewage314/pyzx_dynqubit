OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[6];
cx q[9], q[6];
cx q[9], q[18];
cx q[1], q[9];
