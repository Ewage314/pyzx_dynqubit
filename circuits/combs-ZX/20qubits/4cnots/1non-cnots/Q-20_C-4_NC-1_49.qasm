OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[13];
cx q[5], q[8];
cx q[19], q[5];
cx q[6], q[19];
cx q[5], q[2];
