OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[4];
cx q[13], q[12];
cx q[19], q[4];
cx q[5], q[19];
