OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[4];
cx q[1], q[11];
cx q[13], q[1];
cx q[7], q[2];
