OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[19];
cx q[7], q[0];
cx q[0], q[10];
cx q[12], q[8];
