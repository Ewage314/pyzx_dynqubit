OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[17];
cx q[10], q[8];
cx q[7], q[15];
cx q[7], q[19];
