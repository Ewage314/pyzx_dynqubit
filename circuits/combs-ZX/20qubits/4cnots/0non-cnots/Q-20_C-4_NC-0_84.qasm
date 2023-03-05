OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[6];
cx q[7], q[17];
cx q[6], q[10];
cx q[7], q[3];
