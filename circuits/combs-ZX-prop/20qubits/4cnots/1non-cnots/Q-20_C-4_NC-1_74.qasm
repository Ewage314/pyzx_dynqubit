OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[13];
cx q[16], q[5];
cx q[12], q[2];
cx q[11], q[4];
cx q[7], q[0];
