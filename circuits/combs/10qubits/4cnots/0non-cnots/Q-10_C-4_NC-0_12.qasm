OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[6];
cx q[8], q[7];
cx q[8], q[6];
cx q[0], q[7];
