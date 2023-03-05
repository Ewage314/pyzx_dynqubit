OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[19];
cx q[5], q[17];
cx q[7], q[10];
cx q[15], q[8];
