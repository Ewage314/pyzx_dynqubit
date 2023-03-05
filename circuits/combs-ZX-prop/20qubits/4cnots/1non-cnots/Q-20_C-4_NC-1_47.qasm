OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[17];
cx q[13], q[15];
cx q[0], q[14];
z q[14];
cx q[19], q[0];
