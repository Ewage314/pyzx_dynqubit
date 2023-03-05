OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[18];
cx q[16], q[6];
cx q[13], q[19];
cx q[4], q[7];
