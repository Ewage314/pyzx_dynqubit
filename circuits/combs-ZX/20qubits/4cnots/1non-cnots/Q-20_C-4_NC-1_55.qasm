OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[4];
z q[3];
cx q[13], q[1];
cx q[7], q[13];
cx q[13], q[11];
