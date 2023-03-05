OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[17];
cx q[19], q[13];
cx q[14], q[15];
cx q[2], q[0];
cx q[18], q[10];
