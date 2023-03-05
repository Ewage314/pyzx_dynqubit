OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[19], q[2];
cx q[7], q[13];
z q[11];
cx q[5], q[9];
