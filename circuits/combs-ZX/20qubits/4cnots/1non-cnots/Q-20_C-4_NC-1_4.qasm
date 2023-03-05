OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[3];
cx q[15], q[4];
cx q[4], q[15];
cx q[16], q[13];
cx q[16], q[4];
