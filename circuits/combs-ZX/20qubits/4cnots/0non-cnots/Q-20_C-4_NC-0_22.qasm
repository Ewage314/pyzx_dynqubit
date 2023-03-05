OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[13];
cx q[1], q[18];
cx q[16], q[8];
cx q[4], q[15];
