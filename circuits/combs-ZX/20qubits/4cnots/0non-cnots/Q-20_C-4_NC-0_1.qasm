OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[18];
cx q[4], q[13];
cx q[12], q[0];
cx q[4], q[15];
