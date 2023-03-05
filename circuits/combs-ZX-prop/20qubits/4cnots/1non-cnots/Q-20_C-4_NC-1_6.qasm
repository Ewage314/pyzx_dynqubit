OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[16];
cx q[11], q[13];
cx q[15], q[17];
z q[14];
cx q[18], q[16];
