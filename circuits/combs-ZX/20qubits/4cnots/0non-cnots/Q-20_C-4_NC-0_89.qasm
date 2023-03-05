OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[10];
cx q[0], q[8];
cx q[7], q[12];
cx q[18], q[4];
