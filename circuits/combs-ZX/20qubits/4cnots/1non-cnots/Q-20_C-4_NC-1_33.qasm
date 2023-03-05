OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[19];
cx q[17], q[4];
z q[12];
cx q[17], q[6];
cx q[1], q[13];
