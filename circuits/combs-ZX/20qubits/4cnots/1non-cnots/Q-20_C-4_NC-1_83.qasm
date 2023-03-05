OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[13];
cx q[10], q[16];
cx q[11], q[18];
cx q[18], q[9];
cx q[6], q[12];
