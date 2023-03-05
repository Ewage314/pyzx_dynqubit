OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[9];
cx q[6], q[3];
cx q[0], q[14];
cx q[1], q[5];
