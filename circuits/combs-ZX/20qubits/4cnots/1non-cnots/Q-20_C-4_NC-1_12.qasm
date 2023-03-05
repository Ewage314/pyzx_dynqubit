OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[0];
z q[13];
cx q[5], q[19];
cx q[15], q[5];
cx q[4], q[18];
