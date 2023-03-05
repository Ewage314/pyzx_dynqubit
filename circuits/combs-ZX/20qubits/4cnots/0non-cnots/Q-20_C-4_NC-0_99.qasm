OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[12];
cx q[19], q[3];
cx q[9], q[15];
cx q[1], q[19];
