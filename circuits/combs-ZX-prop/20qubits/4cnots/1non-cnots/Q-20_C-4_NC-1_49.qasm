OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[11];
cx q[17], q[12];
cx q[15], q[18];
z q[9];
cx q[3], q[17];
