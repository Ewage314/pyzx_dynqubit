OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[7];
cx q[8], q[9];
cx q[0], q[13];
z q[18];
cx q[13], q[5];
