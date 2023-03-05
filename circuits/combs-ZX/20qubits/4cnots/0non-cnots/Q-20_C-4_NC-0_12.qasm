OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[5];
cx q[14], q[19];
cx q[18], q[10];
cx q[11], q[15];
