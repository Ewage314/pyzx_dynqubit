OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[17];
z q[15];
cx q[5], q[2];
cx q[15], q[19];
cx q[17], q[14];
