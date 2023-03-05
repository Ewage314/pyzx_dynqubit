OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[5];
cx q[17], q[3];
cx q[17], q[0];
cx q[11], q[19];
