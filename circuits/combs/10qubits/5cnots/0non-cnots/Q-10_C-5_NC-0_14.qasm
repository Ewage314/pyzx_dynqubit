OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[1];
cx q[8], q[7];
cx q[4], q[1];
cx q[9], q[8];
cx q[2], q[8];
