OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[11];
cx q[0], q[13];
z q[8];
cx q[13], q[14];
cx q[13], q[18];
