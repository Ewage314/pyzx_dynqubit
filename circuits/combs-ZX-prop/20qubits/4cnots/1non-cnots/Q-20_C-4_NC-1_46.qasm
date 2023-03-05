OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[18];
cx q[11], q[19];
cx q[12], q[19];
z q[9];
cx q[5], q[11];
