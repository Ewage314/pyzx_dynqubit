OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[13];
cx q[9], q[15];
cx q[1], q[3];
cx q[17], q[13];
cx q[19], q[1];
