OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[6];
cx q[11], q[18];
cx q[11], q[0];
cx q[3], q[9];
cx q[16], q[17];
