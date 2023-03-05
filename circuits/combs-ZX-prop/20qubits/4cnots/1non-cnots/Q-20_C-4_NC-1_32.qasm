OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[4];
cx q[4], q[7];
z q[7];
cx q[12], q[18];
cx q[12], q[13];
