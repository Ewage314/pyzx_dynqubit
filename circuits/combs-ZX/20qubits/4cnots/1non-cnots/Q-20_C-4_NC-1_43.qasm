OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[19];
z q[9];
cx q[12], q[1];
cx q[17], q[12];
cx q[13], q[6];
