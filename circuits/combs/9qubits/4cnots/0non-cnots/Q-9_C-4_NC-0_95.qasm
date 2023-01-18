OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[3], q[5];
cx q[8], q[5];
cx q[4], q[0];
