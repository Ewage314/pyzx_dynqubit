OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[2];
cx q[10], q[17];
cx q[11], q[4];
z q[19];
cx q[11], q[9];
