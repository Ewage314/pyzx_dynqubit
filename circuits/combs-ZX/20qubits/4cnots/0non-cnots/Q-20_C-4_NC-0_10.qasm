OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[7];
cx q[9], q[4];
cx q[1], q[8];
cx q[3], q[7];
