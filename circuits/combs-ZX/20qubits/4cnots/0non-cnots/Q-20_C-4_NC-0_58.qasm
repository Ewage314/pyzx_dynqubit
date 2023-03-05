OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[15];
cx q[18], q[9];
cx q[8], q[0];
cx q[8], q[19];
