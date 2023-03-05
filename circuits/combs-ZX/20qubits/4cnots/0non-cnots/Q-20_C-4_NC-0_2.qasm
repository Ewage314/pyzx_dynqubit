OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[3];
cx q[19], q[0];
cx q[13], q[10];
cx q[10], q[19];
