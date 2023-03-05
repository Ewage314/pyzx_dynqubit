OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[1], q[17];
cx q[9], q[14];
cx q[8], q[9];
