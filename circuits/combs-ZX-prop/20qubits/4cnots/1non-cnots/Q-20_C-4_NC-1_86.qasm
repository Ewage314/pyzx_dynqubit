OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[12];
cx q[5], q[15];
cx q[1], q[3];
cx q[11], q[8];
cx q[7], q[9];
