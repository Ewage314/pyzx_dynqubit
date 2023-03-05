OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[8];
cx q[15], q[5];
cx q[6], q[9];
cx q[12], q[14];
