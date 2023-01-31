OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[2];
cx q[4], q[5];
cx q[8], q[6];
cx q[5], q[7];
