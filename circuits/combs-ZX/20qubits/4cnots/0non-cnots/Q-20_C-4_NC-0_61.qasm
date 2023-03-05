OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[12];
cx q[0], q[15];
cx q[10], q[18];
cx q[16], q[8];
