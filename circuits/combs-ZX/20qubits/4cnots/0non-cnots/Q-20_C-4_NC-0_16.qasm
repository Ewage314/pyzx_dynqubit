OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[12];
cx q[7], q[19];
cx q[1], q[0];
cx q[3], q[12];
