OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[18];
cx q[4], q[12];
cx q[19], q[10];
cx q[15], q[5];
