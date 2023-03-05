OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[15];
cx q[11], q[6];
cx q[17], q[14];
z q[12];
cx q[15], q[2];
