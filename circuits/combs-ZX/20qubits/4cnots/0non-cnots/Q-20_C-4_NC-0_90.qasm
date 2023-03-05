OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[18];
cx q[3], q[2];
cx q[5], q[14];
cx q[17], q[2];
