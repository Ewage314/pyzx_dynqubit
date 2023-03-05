OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[19];
cx q[13], q[4];
cx q[8], q[0];
cx q[0], q[7];
cx q[5], q[11];
