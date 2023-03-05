OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[11];
cx q[15], q[9];
z q[13];
cx q[12], q[6];
cx q[12], q[9];
