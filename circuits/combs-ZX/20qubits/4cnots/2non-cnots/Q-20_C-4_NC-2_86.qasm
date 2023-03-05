OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[19];
z q[1];
cx q[11], q[17];
z q[8];
cx q[11], q[15];
cx q[13], q[15];
