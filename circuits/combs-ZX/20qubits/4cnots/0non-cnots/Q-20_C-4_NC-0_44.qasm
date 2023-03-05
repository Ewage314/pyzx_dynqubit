OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[12];
cx q[18], q[5];
cx q[18], q[11];
cx q[19], q[10];
