OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[5];
z q[13];
cx q[11], q[1];
cx q[2], q[8];
cx q[8], q[3];
cx q[18], q[15];
