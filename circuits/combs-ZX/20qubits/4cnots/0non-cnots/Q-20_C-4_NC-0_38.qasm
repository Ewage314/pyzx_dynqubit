OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[1];
cx q[2], q[6];
cx q[19], q[12];
cx q[1], q[15];
