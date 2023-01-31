OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[5];
cx q[2], q[7];
cx q[7], q[5];
cx q[7], q[1];
cx q[8], q[5];
